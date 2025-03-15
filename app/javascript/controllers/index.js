// This file is auto-generated by ./bin/rails stimulus:manifest:update
// Run that command whenever you add a new controller or create them with
// ./bin/rails generate stimulus controllerName

import { application } from "./application";

// import ConfirmController from "./confirm_controller"
// application.register("confirm", ConfirmController)

import FocusInputController from "./focus_input_controller";
application.register("focus-input", FocusInputController);

import HelloController from "./hello_controller";
application.register("hello", HelloController);

import RemovalsController from "./removals_controller";
application.register("removals", RemovalsController);
