Pusher Monitor & LogBox Appender
================

Setup & Installation
---------------------

box install nsg-module-pusher

Getting started get a free pusher account at www.pusherapp.com. To use the module, point your browser to http://{{domain}}/pusher and the handler will show you a real-time none persistant log viewer.

####Add the following structure to Coldbox.cfc

    pusher = {
        appID           = "{{pusher_app_id}}",
        pusherChannel   = "logBox",
        pusherAppKey    = "{{pusher_app_key}}",
        pusherAppSecret = "{{pusher_app_secret}}"
    }


LogBox Appender
---------------------

####An example appender setup could look like this

        logBox = {
            // Define Appenders
            appenders = {
                pusherAppender = {
                    class = "modules.nsg-module-pusher.appenders.pusherAppender",
                    properties = {
                        appID           = "{{pusher_app_id}}",
                        pusherChannel   = "logBox",
                        pusherAppKey    = "{{pusher_app_key}}",
                        pusherAppSecret = "{{pusher_app_secret}}"
                    }
                },
                coldboxTracer = { class="coldbox.system.logging.appenders.ConsoleAppender" }
            },
            // Root Logger
            root = { levelMin="FATAL", levelMax="ERROR", appenders="*" }
        };
