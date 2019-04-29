# About

This is experimental [CommonJS modules]implementation in Ruby. The main difference is that in this implementation everything is local, there isn't any messing with the global namespace. It has a lot of advantages include [hot code reloading].

# Usage

We are working with the `example.rb`:

    # It works with $LOAD_PATH exactly as Kernel#require does
    $: << File.expand_path(".")

    require "import"

    sys = import("example")
    # => #<CommonJS::Proxy:0x00000101170398 @data={:language => "Ruby", :VERSION_ => "0.0.1", :say_hello => #<Method: #<CommonJS::Proxy:0x000001024e9d48 ...>.say_hello>}>

    sys.language
    # => "Ruby"
    
    sys.say_hello
    # => "Hello World!"
