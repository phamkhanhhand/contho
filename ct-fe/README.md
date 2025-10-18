# Contho


src/
├── app/
│   ├── auth/           # Core module (authentication, etc.)
│   ├── shared/         # Common
│   ├── shell/          # Shell module (entry point of the app, layout, routing)
│   ├── features/       # Feature modules (specific features or areas of the app)
│   └── app.module.ts   # Root module (imports the Shell and other modules)


# create module features
ng g m features/demo
ng g c features/demo/demo --module=features/demo
# create index.ts file manually (tu tao bang tay file index.ts)

# example
ng g m features/employee-manage
ng g c features/employee-manage/employee-list --module=features/employee-manage
 
# example for shared components
ng g m shared/components/ct-textbox
ng g c shared/components/ct-textbox/ct-textbox --module=shared/components/ct-textbox

 
## Development server

Run `ng serve` for a dev server. Navigate to `http://localhost:4200/`. The application will automatically reload if you change any of the source files.

## Code scaffolding

Run `ng generate component component-name` to generate a new component. You can also use `ng generate directive|pipe|service|class|guard|interface|enum|module`.

## Build

Run `ng build` to build the project. The build artifacts will be stored in the `dist/` directory.
or run `ng build -c production`