# SimpleAdmin
A framework for creating admin dashboards in an instant.

## v0.2.0-alpha - 2018-01-14

### Added
- [Dmitriy Strukov] Add mounter for routes `mount_for_simple_admin`
- [Dmitriy Strukov] Add documentation for fields generator
- [Dmitriy Strukov] Add Devise integration documentation

### Fixed
- [Dmitriy Strukov] Changed old endpoint for root
- [Dmitriy Strukov] Remove unused helper method 

## v0.1.2-alpha - 2018-01-07

### Changed
- [Dmitriy Strukov] Remove user model template in the initialize generator

### Fixed
- [Dmitriy Strukov] Remove `rails-ujs` and move tabs logic to another file 
- [Dmitriy Strukov] Number field form template

## v0.1.1-alpha - 2018-01-02

### Added
- [Dmitriy Strukov] Create Issue template
- [Marina Belova] Entity and fields generator. This is useful for large models with many fields quantity.

### Changed
- [Dmitriy Strukov] Use locales instead of hardcode in templates

### Fixed
- [Dmitriy Strukov] Pagination styles

## v0.1.0-alpha - 2017-12-06
### Added
- [Dmitriy Strukov] Allow to manage a fields for entities

- [Dmitriy Strukov] Introduced built in resources in admin panel
- [Dmitriy Strukov] Introduced `rails g simple_admin:install` generator
- [Dmitriy Strukov] Introduced `rails g simple_admin:migration` generator

- [Dmitriy Strukov] Introduced `SimpleAdmin::ResourceController::ControllerBuilder` runtime controller builder
- [Dmitriy Strukov] Introduced `SimpleAdmin::Search` for dynamically searching by selected fields
- [Dmitriy Strukov] Introduced `SimpleAdmin::ResourceController::Crudify` as CRUD for standard controller
- [Dmitriy Strukov] Introduced `SimpleAdmin::ResourceController::CrudifyDynamicResource` as CRUD for controller with dynamic actions

