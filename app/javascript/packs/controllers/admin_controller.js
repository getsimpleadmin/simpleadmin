import { Controller } from 'stimulus';

export default class extends Controller {
    static targets = ['collectionFields', 'formFields', 'showFields', 'iconStyle', 'styleInput', 'dropdownMenu',
                      'collectionTab', 'formTab', 'showTab', 'flashMessage', 'importModal', 'actionDropdownMenu', 'sidebarMenu']

    connect() {
        this.connectWysiwygEditor();
        this.connectIconPicker();

        this.connectCharts();
        this.connectSortableItems();
    }

    connectWysiwygEditor() {
        var selector = 'wysiwygEditor',
            settings = { theme: 'snow' };

        if (!document.getElementById(selector)) {
            return false;
        }

        const Quill = require('quill');

        var quill = new Quill(`#${selector}`, settings);

        document.querySelector('form').onsubmit = function() {
            var textInputId = `simple_admin_resource_${wysiwygEditor.dataset.fieldname}`,
            textInput = document.getElementById(textInputId);

            textInput.value = quill.root.innerHTML;
        }
    }

    connectIconPicker() {
        var selector = 'icon-picker';

        if (!document.getElementsByClassName(selector)) {
            return false;
        }

        require('fontawesome-iconpicker');
        const $ = require('jquery');

        var settings = {
            icons: [
                { title: 'si si-user', searchTerms: ['user'] },
                { title: 'si si-user-follow', searchTerms: ['follow'] },
                { title: 'si si-phone', searchTerms: ['phone'] },
                { title: 'si si-map', searchTerms: ['map'] },
                { title: 'si si-event', searchTerms: ['event'] },
                { title: 'si si-organization', searchTerms: ['organization'] },
                { title: 'si si-notebook', searchTerms: ['notebook'] },
                { title: 'si si-wallet', searchTerms: ['wallet'] },
                { title: 'si si-globe', searchTerms: ['globe'] },
                { title: 'si si-docs', searchTerms: ['docs'] },
                { title: 'si si-bag', searchTerms: ['bag'] },
                { title: 'si si-tag', searchTerms: ['tag'] },
                { title: 'si si-support', searchTerms: ['support'] },
                { title: 'si si-question', searchTerms: ['question'] },
                { title: 'si si-home', searchTerms: ['home'] },
                { title: 'si si-settings', searchTerms: ['settings'] },
                { title: 'si si-credit-card', searchTerms: ['card'] },
                { title: 'si si-puzzle', searchTerms: ['widget'] },
                { title: 'si si-layers', searchTerms: ['layer'] },
                { title: 'si si-users', searchTerms: ['users'] },
                { title: 'si si-folder-alt', searchTerms: ['folder'] },
                ]
        };

        Array.prototype.forEach.call(document.getElementsByClassName(selector), function(input) {
            $(input).iconpicker(settings);
        });
    }

    connectCharts() {
        var selector = 'chart';

        if (!document.getElementsByClassName(selector)) {
            return false;
        }

        const Chart = require('chart.js');

        Chart.defaults.global.defaultFontColor = '#555555',
        Chart.defaults.scale.gridLines.color = 'transparent',
        Chart.defaults.scale.gridLines.zeroLineColor = 'transparent',
        Chart.defaults.scale.ticks.beginAtZero = !0,
        Chart.defaults.global.elements.line.borderWidth = 2,
        Chart.defaults.global.elements.point.radius = 5,
        Chart.defaults.global.elements.point.hoverRadius = 7,
        Chart.defaults.global.tooltips.cornerRadius = 3,
        Chart.defaults.global.legend.display = !1;

        Array.prototype.forEach.call(document.getElementsByClassName(selector), function(chartTag) {
            new Chart(chartTag, {
              type: 'line',
              data: {
                labels: JSON.parse(chartTag.dataset.chartDays.replace(/'/g, '"')),
                datasets: [{
                  label: 'This Week',
                  fill: !0,
                  backgroundColor: 'rgba(66,165,245,.45)',
                  borderColor: 'rgba(66,165,245,1)',
                  pointBackgroundColor: 'rgba(66,165,245,1)',
                  pointBorderColor: '#fff',
                  pointHoverBackgroundColor: '#fff',
                  pointHoverBorderColor: 'rgba(66,165,245,1)',
                  data: JSON.parse(chartTag.dataset.chartDataset.replace(/'/g, '"')),
                }],
              },
              options: {
                scales: {
                  yAxes: [{
                    ticks: {
                      suggestedMax: 50,
                    },
                  }],
                },
                tooltips: {
                  callbacks: {
                    label(e, r) {
                      return ` ${e.yLabel} Resources`;
                    },
                  },
                },
              }
            });
        });
    }

    connectSortableItems() {
        var collectionItemsSelector = 'collection-items',
            formItemsSelector = 'form-items',
            showItemsSelector = 'show-items';

        if (document.getElementById(collectionItemsSelector)) {
          this.connectSortable(document.getElementById(collectionItemsSelector), this, 'collectionFieldsTargets');
        }

        if (document.getElementById(formItemsSelector)) {
          this.connectSortable(document.getElementById(formItemsSelector), this, 'formFieldsTargets');
        }

        if (document.getElementById(showItemsSelector)) {
          this.connectSortable(document.getElementById(showItemsSelector), this, 'showFieldsTargets');
        }

    }

    connectSortable(items, context, contextFieldType) {
      const Sortable = require('sortablejs');
      const $ = require('jquery');

      Sortable.create(items, {
        onUpdate(event) {
          var counter = 0;

          context[contextFieldType].forEach(function(field) {
            var data = {},
                url;

            data[items.dataset.resourcename] = { sort_order: counter };

            if (items.dataset.urlparam) {
              url = items.dataset.url + field.dataset.id + items.dataset.urlparam;
            } else {
              url = items.dataset.url + field.dataset.id;
            }

            $.ajax({
              type: 'PUT',
              url,
              beforeSend(xhr) {
                xhr.setRequestHeader('X-CSRF-Token', document.querySelector('meta[name="csrf-token"]').content);
              },
              data,
              dataType: 'JSON',
            });

            counter += 1;
          });
        },
      });
    }

    hideFlashMessage() {
      this.flashMessageTarget.classList.add('hidden');
    }

    selectStyle(event) {
      this.iconStyleTargets.forEach((iconStyle) => {
        iconStyle.classList.remove('color-palette-active');
      });

      event.target.parentElement.classList.add('color-palette-active');

      this.styleInputTarget.value = event.target.dataset.style;
    }

    showImportModal() {
      this.importModalTarget.classList.remove('hidden');
    }

    hideImportModal() {
      this.importModalTarget.classList.add('hidden');
    }

    toggleActionDropdownMenu() {
      if (this.actionDropdownMenuTarget.classList.contains('show')) {
        this.actionDropdownMenuTarget.classList.remove('show');
      } else {
        this.actionDropdownMenuTarget.classList.add('show');
      }
    }

    toggleMobileMenu() {
      if (this.sidebarMenuTarget.classList.contains('sidebar-mobile-open')) {
        this.sidebarMenuTarget.classList.remove('sidebar-mobile-open');
      } else {
        this.sidebarMenuTarget.classList.add('sidebar-mobile-open');
      }
    }

    toggleDropdownMenu() {
      if (this.dropdownMenuTarget.classList.contains('show')) {
        this.dropdownMenuTarget.classList.remove('show');
      } else {
        this.dropdownMenuTarget.classList.add('show');
      }
    }

    switchTab(event) {
      const tabName = event.target.dataset.tab;

      Array.prototype.forEach.call(document.getElementsByClassName('nav-link'), function(item) {
        item.classList.remove('active');
      });

      event.target.classList.add('active');

      if (tabName == 'form') {
        this.collectionTabTarget.classList.remove('active');
        this.formTabTarget.classList.add('active');
        this.showTabTarget.classList.remove('active');
      } else if (tabName == 'collection') {
        this.collectionTabTarget.classList.add('active');
        this.formTabTarget.classList.remove('active');
        this.showTabTarget.classList.remove('active');
      } else if (tabName == 'show') {
        this.collectionTabTarget.classList.remove('active');
        this.formTabTarget.classList.remove('active');
        this.showTabTarget.classList.add('active');
      }
    }

    toggleFieldBlock(event) {
      var field = this.allFields().find(item => item.dataset.id == event.target.dataset.id);

      var blockContent = field.getElementsByClassName('block-content')[0],
          iconElement = field.getElementsByTagName('i')[0];

      if (blockContent.classList.contains('hidden')) {
        blockContent.classList.remove('hidden');

        iconElement.classList.remove('fa-angle-down');
        iconElement.classList.add('fa-angle-up');
      } else {
        blockContent.classList.add('hidden');

        iconElement.classList.remove('fa-angle-up');
        iconElement.classList.add('fa-angle-down');
      }
    }

    allFields() {
      return this.collectionFieldsTargets.concat(this.formFieldsTargets).concat(this.showFieldsTargets);
    }
}
