#!/bin/bash

# MD-1 帳號
npx @redocly/cli build-docs ./MD-1_帳號/MD-1-Auth.yaml --output ./html/MD-1_帳號/MD-1-Auth.html
npx @redocly/cli build-docs ./MD-1_帳號/MD-1-Role.yaml --output ./html/MD-1_帳號/MD-1-Role.html
npx @redocly/cli build-docs ./MD-1_帳號/MD-1-User.yaml --output ./html/MD-1_帳號/MD-1-User.html

# MD-2 系統排程
npx @redocly/cli build-docs ./MD-2_系統排程/MD-2-Routines.yaml --output ./html/MD-2_系統排程/MD-2-Routines.html