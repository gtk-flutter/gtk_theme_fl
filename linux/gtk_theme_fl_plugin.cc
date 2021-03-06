#include "include/gtk_theme_fl/gtk_theme_fl_plugin.h"

#include <flutter_linux/flutter_linux.h>
#include <gtk/gtk.h>
#include <iostream>
#include <pango/pango-font.h>
#include <sys/utsname.h>

#include <cstring>

#define GTK_THEME_FL_PLUGIN(obj)                                               \
  (G_TYPE_CHECK_INSTANCE_CAST((obj), gtk_theme_fl_plugin_get_type(),           \
                              GtkThemeFlPlugin))

struct _GtkThemeFlPlugin {
  GObject parent_instance;
  FlPluginRegistrar *registrar;
};

G_DEFINE_TYPE(GtkThemeFlPlugin, gtk_theme_fl_plugin, g_object_get_type())

static int get_color_int_from_RGBA(GdkRGBA *rgba) {
  int a = rgba->alpha * 255;
  int r = rgba->red * 255;
  int g = rgba->green * 255;
  int b = rgba->blue * 255;

  return (a & 0xff) << 24 | (r & 0xff) << 16 | (g & 0xff) << 8 | (b & 0xff);
}

static FlValue *get_font() {
  GtkWidget *label = gtk_label_new("Label!");
  GtkStyleContext *labelContext = gtk_widget_get_style_context(label);

  GValue value = G_VALUE_INIT;
  gtk_style_context_get_property(labelContext, "font", GTK_STATE_FLAG_NORMAL,
                                 &value);

  PangoFontDescription *font =
      (PangoFontDescription *)g_value_peek_pointer(&value);
  char *ret = pango_font_description_to_string(font);

  gtk_widget_destroy(label);

  return fl_value_new_string(ret);
}

/* static void g_value_print(GValue* value) { */
/*     gchar * strVal = g_strdup_value_contents (value); */
/*     g_print ("gvalue: %s\n", strVal); */
/*     free (strVal); */
/* } */

/* static int get_color_from_widget(GtkWidget *widget, const gchar *property, */
/*                                  GtkStateFlags state) { */
/*   GValue color = G_VALUE_INIT; */

/*   GtkStyleContext *context = gtk_widget_get_style_context(widget); */

/*   gtk_style_context_get_property(context, property, state, &color); */

/*   GdkRGBA *color_rgba = (GdkRGBA *)g_value_peek_pointer(&color); */

/*   int ret = get_color_int_from_RGBA(color_rgba); */

/*   gdk_rgba_free(color_rgba); */

/*   return ret; */
/* } */

// Called when a method call is received from Flutter.
static void gtk_theme_fl_plugin_handle_method_call(GtkThemeFlPlugin *self,
                                                   FlMethodCall *method_call) {
  g_autoptr(FlMethodResponse) response = nullptr;

  const gchar *method = fl_method_call_get_name(method_call);

  if (strcmp(method, "getThemeData") == 0) {
    GtkSettings *settings;
    gchar *theme_name;
    settings = gtk_settings_get_default();
    g_object_get(settings, "gtk-theme-name", &theme_name, NULL);

    GtkCssProvider *provider = gtk_css_provider_get_named(theme_name, NULL);

    GtkStyleContext *context = gtk_style_context_new();
    gtk_style_context_add_provider(context, (GtkStyleProvider *)provider, 800);

    GdkRGBA theme_fg_color;
    gtk_style_context_lookup_color(context, "theme_fg_color", &theme_fg_color);

    GdkRGBA theme_text_color;
    gtk_style_context_lookup_color(context, "theme_text_color",
                                   &theme_text_color);

    GdkRGBA theme_bg_color;
    gtk_style_context_lookup_color(context, "theme_bg_color", &theme_bg_color);

    GdkRGBA theme_base_color;
    gtk_style_context_lookup_color(context, "theme_base_color",
                                   &theme_base_color);

    GdkRGBA theme_selected_bg_color;
    gtk_style_context_lookup_color(context, "theme_selected_bg_color",
                                   &theme_selected_bg_color);

    GdkRGBA theme_selected_fg_color;
    gtk_style_context_lookup_color(context, "theme_selected_fg_color",
                                   &theme_selected_fg_color);

    /* these are pretty self explicative */
    GdkRGBA warning_color;
    GdkRGBA error_color;
    GdkRGBA success_color;
    gtk_style_context_lookup_color(context, "warning_color", &warning_color);
    gtk_style_context_lookup_color(context, "error_color", &error_color);
    gtk_style_context_lookup_color(context, "success_color", &success_color);

    g_autoptr(FlValue) result = fl_value_new_map();
    fl_value_set_string(result, "name", fl_value_new_string(theme_name));
    fl_value_set_string(
        result, "theme_fg_color",
        fl_value_new_int(get_color_int_from_RGBA(&theme_fg_color)));
    fl_value_set_string(
        result, "theme_text_color",
        fl_value_new_int(get_color_int_from_RGBA(&theme_text_color)));
    fl_value_set_string(
        result, "theme_bg_color",
        fl_value_new_int(get_color_int_from_RGBA(&theme_bg_color)));
    fl_value_set_string(
        result, "theme_base_color",
        fl_value_new_int(get_color_int_from_RGBA(&theme_base_color)));
    fl_value_set_string(
        result, "theme_selected_bg_color",
        fl_value_new_int(get_color_int_from_RGBA(&theme_selected_bg_color)));
    fl_value_set_string(
        result, "theme_selected_fg_color",
        fl_value_new_int(get_color_int_from_RGBA(&theme_selected_fg_color)));

    fl_value_set_string(
        result, "warning_color",
        fl_value_new_int(get_color_int_from_RGBA(&warning_color)));
    fl_value_set_string(
        result, "error_color",
        fl_value_new_int(get_color_int_from_RGBA(&error_color)));
    fl_value_set_string(
        result, "success_color",
        fl_value_new_int(get_color_int_from_RGBA(&success_color)));

    // GENERIC COLORS END
    // WIDGET SPECIFIC STUFF STARTS
    g_autoptr(FlValue) font = get_font();
    fl_value_set_string(result, GTK_STYLE_PROPERTY_FONT, font);

    response = FL_METHOD_RESPONSE(fl_method_success_response_new(result));
  } else {
    response = FL_METHOD_RESPONSE(fl_method_not_implemented_response_new());
  }

  fl_method_call_respond(method_call, response, nullptr);
}

static void gtk_theme_fl_plugin_dispose(GObject *object) {
  G_OBJECT_CLASS(gtk_theme_fl_plugin_parent_class)->dispose(object);
}

static void gtk_theme_fl_plugin_class_init(GtkThemeFlPluginClass *klass) {
  G_OBJECT_CLASS(klass)->dispose = gtk_theme_fl_plugin_dispose;
}

static void gtk_theme_fl_plugin_init(GtkThemeFlPlugin *self) {}

static void method_call_cb(FlMethodChannel *channel, FlMethodCall *method_call,
                           gpointer user_data) {
  GtkThemeFlPlugin *plugin = GTK_THEME_FL_PLUGIN(user_data);
  gtk_theme_fl_plugin_handle_method_call(plugin, method_call);
}

void gtk_theme_fl_plugin_register_with_registrar(FlPluginRegistrar *registrar) {
  GtkThemeFlPlugin *plugin = GTK_THEME_FL_PLUGIN(
      g_object_new(gtk_theme_fl_plugin_get_type(), nullptr));

  plugin->registrar = FL_PLUGIN_REGISTRAR(g_object_ref(registrar));

  g_autoptr(FlStandardMethodCodec) codec = fl_standard_method_codec_new();
  g_autoptr(FlMethodChannel) channel =
      fl_method_channel_new(fl_plugin_registrar_get_messenger(registrar),
                            "gtk_theme_fl", FL_METHOD_CODEC(codec));
  fl_method_channel_set_method_call_handler(
      channel, method_call_cb, g_object_ref(plugin), g_object_unref);

  g_object_unref(plugin);
}
