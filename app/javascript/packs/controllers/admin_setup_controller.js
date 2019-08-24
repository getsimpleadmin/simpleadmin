import { Controller } from 'stimulus'

export default class extends Controller {
  static targets = ['flashMessage', 'modelCheckbox']

  hideFlashMessage() {
    this.flashMessageTarget.classList.add('hidden');
  }

  unselectAll() {
    this.modelCheckboxTargets.forEach(function(modelCheckbox) {
      modelCheckbox.checked = false;
    })
  }

  selectAll() {
    this.modelCheckboxTargets.forEach(function(modelCheckbox) {
      modelCheckbox.checked = true;
    })
  }
}
