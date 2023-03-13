
# Ruby Getting Started

## Python Install

Many PCs and Macs will have Ruby already installed.

To check if you have Ruby installed on a Windows PC, search in the start bar for Ruby or run the following on the Command Line (cmd.exe):

```
C:\Users\Your Name>ruby -v
```

To check if you have Ruby installed on a Linux or Mac, then on linux open the command line or on Mac open the Terminal and type:

```
ruby -v
```

If you find that you do not have Ruby installed on your computer, then you can download it for free from the following website: https://www.ruby-lang.org/en/

## Ruby Quickstart

Ruby is an interpreted programming language, this means that as a developer you write Ruby (.rb) files in a text editor and then put those files into the Ruby interpreter to be executed.

The way to run a Ruby file is like this on the command line:

```
C:\Users\Your Name>ruby helloworld.rb
```

Where "helloworld.rb" is the name of your Ruby file.

Let's write our first Ruby file, called helloworld.rb, which can be done in any text editor.

```ruby
# helloworld.rb
puts("Hello, World!")
```

Simple as that. Save your file. Open your command line, navigate to the directory where you saved your file, and run:

```
C:\Users\Your Name>python helloworld.rb
```

The output should read:

```
Hello, World!
```

Congratulations, you have written and executed your first Ruby program.

## The Ruby Command Line

To test a short amount of code in Ruby sometimes it is quickest and easiest not to write the code in a file. This is made possible because Ruby can be run as a command line itself.

Type the following on the Windows, Mac or Linux command line:

```
C:\Users\Your Name>irb
```

From there you can write any Ruby, including our hello world example from earlier in the tutorial, which will write "Hello, World!" in the command line:

```
C:\Users\Your Name>irb
irb(main):001:0> puts("Hello world!")
Hello world!
=> nil                                           
irb(main):002:0>
```

Whenever you are done in the "Interactive Ruby", you can simply type `quit` to quit.
