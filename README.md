GraalVM
======

GraalVM is a universal virtual machine for JVM-base languages, Ruby, Python, JavaScript, R, LLVM.

http://www.graalvm.org/

Build
-------

```bash
docker build -t koduki/graalvm:1.0.0-rc1 .
```

Run
------

### Java build

```bash
% docker run -it -v "`pwd`:/src" koduki/graalvm:1.0.0-rc1 javac HelloWorld.java
% docker run -it -v "`pwd`:/src" koduki/graalvm:1.0.0-rc1 java HelloWorld
Hello, World
```

### Native buld & run

```bash
% docker run -it -v "`pwd`:/src" koduki/graalvm:1.0.0-rc1 native-image HelloWorld
Build on Server(pid: 9, port: 26681)*
   classlist:   4,335.15 ms
       (cap):   1,257.90 ms
       setup:   3,411.13 ms
  (typeflow):  12,345.25 ms
   (objects):   3,497.83 ms
  (features):      89.48 ms
    analysis:  16,130.07 ms
    universe:     541.30 ms
     (parse):   4,822.63 ms
    (inline):   2,370.80 ms
   (compile):  20,626.56 ms
     compile:  28,372.55 ms
       image:   1,507.64 ms
       write:     489.70 ms
     [total]:  54,945.94 ms
% docker run -it -v "`pwd`:/src" koduki/graalvm:1.0.0-rc1 ./helloworld
Hello, World
```