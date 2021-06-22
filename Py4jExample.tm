<TeXmacs|1.99.21>

<style|<tuple|generic|british|python>>

<\body>
  <doc-data|<doc-title|Py4j Example>|<doc-author|<author-data|<author-name|Darcy
  Shen>>>>

  <section|Environment Setup>

  First of all, switch to the work directory

  <\session|shell|default>
    <\output>
      Shell session inside TeXmacs pid = 31794
    </output>

    <\input|Shell] >
      cd $HOME/github/da-tubi/py4j-example
    </input>

    <\input|Shell] >
      \;
    </input>
  </session>

  Setup for JDK Runtime Environment

  <\session|shell|default>
    <\input|Shell] >
      JAVA_HOME=$HOME/.sdkman/candidates/java/current
    </input>

    <\input|Shell] >
      PATH=$JAVA_HOME/bin:$PATH
    </input>

    <\unfolded-io|Shell] >
      java -version
    <|unfolded-io>
      openjdk version "1.8.0_252"

      OpenJDK Runtime Environment (AdoptOpenJDK)(build 1.8.0_252-b09)

      OpenJDK 64-Bit Server VM (AdoptOpenJDK)(build 25.252-b09, mixed mode)
    </unfolded-io>

    <\input|Shell] >
      \;
    </input>
  </session>

  Python version and required libraries:

  <\session|shell|default>
    <\input|Shell] >
      alias pyenv=$HOME/.pyenv/bin/pyenv
    </input>

    <\unfolded-io|Shell] >
      pyenv version
    <|unfolded-io>
      py4j (set by /Users/da/github/eto-ai/py4j-example/.python-version)
    </unfolded-io>

    <\unfolded-io|Shell] >
      pyenv virtualenvs --bare --skip-aliases \| grep py4j
    <|unfolded-io>
      3.7.10/envs/py4j
    </unfolded-io>

    <\input|Shell] >
      \;
    </input>
  </session>

  Launch Python session via Python -\<gtr\> 3.7.10/envs/py4j.

  <\session|python|3.7.10/envs/py4j>
    <\input>
      \<gtr\>\<gtr\>\<gtr\>\ 
    <|input>
      from pip._internal.operations import freeze
    </input>

    <\unfolded-io>
      \<gtr\>\<gtr\>\<gtr\>\ 
    <|unfolded-io>
      for x in freeze.freeze():

      \ \ \ \ print(x)
    <|unfolded-io>
      pip==20.1.1

      py4j==0.10.9.2

      setuptools==47.1.0
    </unfolded-io>

    <\input>
      \<gtr\>\<gtr\>\<gtr\>\ 
    <|input>
      \;
    </input>
  </session>

  <section|Example Python Session>

  <\session|shell|default>
    <\unfolded-io|Shell] >
      bin/mill main.run
    <|unfolded-io>
      [34m[3/39] mill.scalalib.ZincWorkerModule.worker [39m

      [1A[2K[9999D[34m[5/39] main.sources [39m

      [1A[2K[9999D[34m[10/39] main.resources [39m

      [1A[2K[9999D[34m[39/39] main.run [39m

      Gateway Server Started

      <script-busy>
    </unfolded-io>

    <\input|Shell] >
      \;
    </input>
  </session>

  <\session|python|3.7.10/envs/py4j>
    <\output>
      Python 3.7.10 (default, Feb 26 2021, 10:16:00)\ 

      [Clang 10.0.0 ]

      Python plugin for TeXmacs.

      Please see the documentation in Help -\<gtr\> Plugins -\<gtr\> Python
    </output>

    <\input>
      \<gtr\>\<gtr\>\<gtr\>\ 
    <|input>
      from py4j.java_gateway import JavaGateway
    </input>

    <\input>
      \<gtr\>\<gtr\>\<gtr\>\ 
    <|input>
      gateway = JavaGateway()
    </input>

    <\input>
      \<gtr\>\<gtr\>\<gtr\>\ 
    <|input>
      stack = gateway.entry_point.getStack()
    </input>

    <\input>
      \<gtr\>\<gtr\>\<gtr\>\ 
    <|input>
      stack.push("First %s" % ('item'))
    </input>

    <\input>
      \<gtr\>\<gtr\>\<gtr\>\ 
    <|input>
      stack.push("Second item")
    </input>

    <\unfolded-io>
      \<gtr\>\<gtr\>\<gtr\>\ 
    <|unfolded-io>
      stack.pop()
    <|unfolded-io>
      Second item
    </unfolded-io>

    <\unfolded-io>
      \<gtr\>\<gtr\>\<gtr\>\ 
    <|unfolded-io>
      stack.pop()
    <|unfolded-io>
      First item
    </unfolded-io>

    <\unfolded-io>
      \<gtr\>\<gtr\>\<gtr\>\ 
    <|unfolded-io>
      stack.pop()
    <|unfolded-io>
      Initial Item
    </unfolded-io>

    <\folded-io>
      \<gtr\>\<gtr\>\<gtr\>\ 
    <|folded-io>
      stack.pop()
    <|folded-io>
      Traceback (most recent call last):

      py4j.protocol.Py4JJavaError: An error occurred while calling o0.pop.

      : java.lang.IndexOutOfBoundsException: Index: 0, Size: 0

      \ \ \ \ \ \ \ \ at java.util.LinkedList.checkElementIndex(LinkedList.java:555)

      \ \ \ \ \ \ \ \ at java.util.LinkedList.remove(LinkedList.java:525)

      \ \ \ \ \ \ \ \ at py4j.examples.Stack.pop(Stack.java:14)

      \ \ \ \ \ \ \ \ at sun.reflect.NativeMethodAccessorImpl.invoke0(Native
      Method)

      \ \ \ \ \ \ \ \ at sun.reflect.NativeMethodAccessorImpl.invoke(NativeMethodAccessorImpl.java:62)

      \ \ \ \ \ \ \ \ at sun.reflect.DelegatingMethodAccessorImpl.invoke(DelegatingMethodAccessorImpl.java:43)

      \ \ \ \ \ \ \ \ at java.lang.reflect.Method.invoke(Method.java:498)

      \ \ \ \ \ \ \ \ at py4j.reflection.MethodInvoker.invoke(MethodInvoker.java:244)

      \ \ \ \ \ \ \ \ at py4j.reflection.ReflectionEngine.invoke(ReflectionEngine.java:357)

      \ \ \ \ \ \ \ \ at py4j.Gateway.invoke(Gateway.java:282)

      \ \ \ \ \ \ \ \ at py4j.commands.AbstractCommand.invokeMethod(AbstractCommand.java:132)

      \ \ \ \ \ \ \ \ at py4j.commands.CallCommand.execute(CallCommand.java:79)

      \ \ \ \ \ \ \ \ at py4j.GatewayConnection.run(GatewayConnection.java:238)

      \ \ \ \ \ \ \ \ at java.lang.Thread.run(Thread.java:748)

      \;

      \;

      During handling of the above exception, another exception occurred:

      \;

      Traceback (most recent call last):

      py4j.protocol.Py4JJavaError: An error occurred while calling o0.pop.

      : java.lang.IndexOutOfBoundsException: Index: 0, Size: 0

      \ \ \ \ \ \ \ \ at java.util.LinkedList.checkElementIndex(LinkedList.java:555)

      \ \ \ \ \ \ \ \ at java.util.LinkedList.remove(LinkedList.java:525)

      \ \ \ \ \ \ \ \ at py4j.examples.Stack.pop(Stack.java:14)

      \ \ \ \ \ \ \ \ at sun.reflect.NativeMethodAccessorImpl.invoke0(Native
      Method)

      \ \ \ \ \ \ \ \ at sun.reflect.NativeMethodAccessorImpl.invoke(NativeMethodAccessorImpl.java:62)

      \ \ \ \ \ \ \ \ at sun.reflect.DelegatingMethodAccessorImpl.invoke(DelegatingMethodAccessorImpl.java:43)

      \ \ \ \ \ \ \ \ at java.lang.reflect.Method.invoke(Method.java:498)

      \ \ \ \ \ \ \ \ at py4j.reflection.MethodInvoker.invoke(MethodInvoker.java:244)

      \ \ \ \ \ \ \ \ at py4j.reflection.ReflectionEngine.invoke(ReflectionEngine.java:357)

      \ \ \ \ \ \ \ \ at py4j.Gateway.invoke(Gateway.java:282)

      \ \ \ \ \ \ \ \ at py4j.commands.AbstractCommand.invokeMethod(AbstractCommand.java:132)

      \ \ \ \ \ \ \ \ at py4j.commands.CallCommand.execute(CallCommand.java:79)

      \ \ \ \ \ \ \ \ at py4j.GatewayConnection.run(GatewayConnection.java:238)

      \ \ \ \ \ \ \ \ at java.lang.Thread.run(Thread.java:748)
    </folded-io>

    <\input>
      \<gtr\>\<gtr\>\<gtr\>\ 
    <|input>
      \;
    </input>
  </session>

  <section|Advanced Topics>

  <subsection|Accessing Java collections and arrays from Python>

  <\session|python|3.7.10/envs/py4j>
    <\output>
      Python 3.7.10 (default, Feb 26 2021, 10:16:00)\ 

      [Clang 10.0.0 ]

      Python plugin for TeXmacs.

      Please see the documentation in Help -\<gtr\> Plugins -\<gtr\> Python
    </output>

    <\input>
      \<gtr\>\<gtr\>\<gtr\>\ 
    <|input>
      from py4j.java_gateway import JavaGateway
    </input>

    <\input>
      \<gtr\>\<gtr\>\<gtr\>\ 
    <|input>
      gateway = JavaGateway()
    </input>

    <\input>
      \<gtr\>\<gtr\>\<gtr\>\ 
    <|input>
      int_class = gateway.jvm.int
    </input>

    <\input>
      \<gtr\>\<gtr\>\<gtr\>\ 
    <|input>
      int_array = gateway.new_array(int_class, 2)
    </input>

    <\input>
      \<gtr\>\<gtr\>\<gtr\>\ 
    <|input>
      int_array[0] = 1
    </input>

    <\input>
      \<gtr\>\<gtr\>\<gtr\>\ 
    <|input>
      int_array[1] = 2
    </input>

    <\unfolded-io>
      \<gtr\>\<gtr\>\<gtr\>\ 
    <|unfolded-io>
      int_array[0]
    <|unfolded-io>
      1
    </unfolded-io>

    <\unfolded-io>
      \<gtr\>\<gtr\>\<gtr\>\ 
    <|unfolded-io>
      for i in int_array:

      \ \ \ \ print(i)
    <|unfolded-io>
      1

      2
    </unfolded-io>

    <\input>
      \<gtr\>\<gtr\>\<gtr\>\ 
    <|input>
      sarray = gateway.new_array(gateway.jvm.java.lang.String, 2, 3)
    </input>

    <\unfolded-io>
      \<gtr\>\<gtr\>\<gtr\>\ 
    <|unfolded-io>
      len(sarray)
    <|unfolded-io>
      2
    </unfolded-io>

    <\unfolded-io>
      \<gtr\>\<gtr\>\<gtr\>\ 
    <|unfolded-io>
      len(sarray[0])
    <|unfolded-io>
      3
    </unfolded-io>

    <\input>
      \<gtr\>\<gtr\>\<gtr\>\ 
    <|input>
      sarray[0][1] = 'hello'
    </input>

    <\unfolded-io>
      \<gtr\>\<gtr\>\<gtr\>\ 
    <|unfolded-io>
      sarray[0][1]
    <|unfolded-io>
      hello
    </unfolded-io>

    <\unfolded-io>
      \<gtr\>\<gtr\>\<gtr\>\ 
    <|unfolded-io>
      sarray[0][0] == None
    <|unfolded-io>
      True
    </unfolded-io>

    <\input>
      \<gtr\>\<gtr\>\<gtr\>\ 
    <|input>
      \;
    </input>
  </session>

  \;
</body>

<\initial>
  <\collection>
    <associate|page-medium|paper>
  </collection>
</initial>

<\references>
  <\collection>
    <associate|auto-1|<tuple|1|1>>
    <associate|auto-2|<tuple|2|1>>
    <associate|auto-3|<tuple|3|2>>
    <associate|auto-4|<tuple|3.1|2>>
  </collection>
</references>

<\auxiliary>
  <\collection>
    <\associate|toc>
      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|1<space|2spc>Environment
      Setup> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-1><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|2<space|2spc>Example
      Python Session> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-2><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|3<space|2spc>Advanced
      Topics> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-3><vspace|0.5fn>

      <with|par-left|<quote|1tab>|3.1<space|2spc>Accessing Java collections
      and arrays from Python <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-4>>
    </associate>
  </collection>
</auxiliary>