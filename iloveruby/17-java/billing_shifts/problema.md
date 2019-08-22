

```
class Time
    attr_reader :hour, :minutes

    def initialize(time='00:00')
        time = time.split(':')
        @hour = time[0].to_i
        @minutes = time[1].to_i
        raise "Invalid time" if !(0..23).include?(@hour) || !(0..59).include?(@minutes)
    end
end
```

```
$ irb
irb(main):001:0> require_relative 'lib/time.rb'
=> true
irb(main):003:0> a = Time.new("18:19")
        1: from /.../irb/inspector.rb:109:in `inspect'
TypeError (uninitialized Time)
Maybe IRB bug!
irb(main):004:0>
```

Después de depurar...
el problema es el nombre de la clase?
