#!/bin/bash
cp -r ./i18n /Users/kerowme/Proyectos/rlb/iphone-app/ReallyLateBooking/
cp ./tiapp.xml /Users/kerowme/Proyectos/rlb/iphone-app/ReallyLateBooking/
coffee -w -c -o /Users/kerowme/Proyectos/rlb/iphone-app/ReallyLateBooking/Resources/js/ ./ui/*/*.coffee ./controller/*.coffee ./services/*.coffee
