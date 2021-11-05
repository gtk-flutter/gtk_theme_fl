//
//  Generated file. Do not edit.
//

// clang-format off

#include "generated_plugin_registrant.h"

#include <flgtk/flgtk_plugin.h>

void fl_register_plugins(FlPluginRegistry* registry) {
  g_autoptr(FlPluginRegistrar) flgtk_registrar =
      fl_plugin_registry_get_registrar_for_plugin(registry, "FlgtkPlugin");
  flgtk_plugin_register_with_registrar(flgtk_registrar);
}
