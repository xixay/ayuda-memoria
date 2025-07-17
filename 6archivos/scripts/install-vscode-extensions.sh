#!/bin/bash

echo "Instalando extensiones globales para todos los perfiles..."

# Extensiones Globales (temas, IA, colaboración)
code --install-extension dracula-theme.theme-dracula
code --install-extension GitHub.copilot
code --install-extension Codeium.codeium
code --install-extension ms-vsliveshare.vsliveshare

echo "Instalando extensiones para Vue + PrimeVue..."

# Vue + PrimeVue
code --install-extension vue.volar
code --install-extension vue.volar-extension-pack
code --install-extension primefaces.primeng
code --install-extension yigitfindikli.primeflexsnippets
code --install-extension yigitfindikli.primengsnippets
code --install-extension formulahendry.auto-close-tag
code --install-extension formulahendry.auto-rename-tag

echo "Instalando extensiones para React + PrimeReact..."

# React + PrimeReact
code --install-extension dsznajder.es7-react-js-snippets
code --install-extension msjsdiag.debugger-for-chrome
code --install-extension yigitfindikli.primeflexsnippets
code --install-extension yigitfindikli.primengsnippets
code --install-extension eamodio.gitlens
code --install-extension esbenp.prettier-vscode

echo "Instalando extensiones para Angular + Angular Material + PrimeFlex..."

# Angular + Angular Material + PrimeFlex
code --install-extension angular.ng-template
code --install-extension ms-vscode.vscode-typescript-next
code --install-extension yigitfindikli.primeflexsnippets
code --install-extension yigitfindikli.primengsnippets
code --install-extension johnpapa.angular2
code --install-extension patricklee.vscode-angular-material

echo "Instalando extensiones para Laravel + PHP..."

# Laravel + PHP
code --install-extension onecentlin.laravel5-snippets
code --install-extension felixfbecker.php-intellisense
code --install-extension bmewburn.vscode-intelephense-client
code --install-extension kokororin.vscode-phpfmt
code --install-extension neilbrayfield.php-docblocker

echo "Instalando extensiones para Node.js / Express / NestJS / Sequelize..."

# Node.js / Express / NestJS / Sequelize
code --install-extension dbaeumer.vscode-eslint
code --install-extension ms-azuretools.vscode-docker
code --install-extension prisma.prisma
code --install-extension bungcip.better-toml
code --install-extension arjun.swagger-viewer
code --install-extension leopotam.csharp
code --install-extension golang.go
code --install-extension christian-kohler.path-intellisense

echo "Instalación completa."

echo "Instalación de extensiones completada."