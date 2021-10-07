// RUN: mkdir -p %t
// RUN: cd %t
// RUN: echo '{"roots": [],"version": 0}' > %t.yaml
// RUN: cp %s main.c
// RUN: not %clang_cc1 -ivfsoverlay %t.yaml main.c 2>&1 | FileCheck %s

// CHECK: {{^}}main.c:8:1: error:
foobarbaz
