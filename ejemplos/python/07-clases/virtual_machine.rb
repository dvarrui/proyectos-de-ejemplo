#!/usr/bin/ruby

class VirtualMachine
  attr_reader :ram, :cpu, :hdd
  def initialize(name, ram=1, cpu=1.3, hdd=100, os="debian")
    @name = name
    @ram = ram.to_f
    @cpu = cpu.to_f
    @hdd = hdd.to_f
    @os = os

    @status = :stopped
    @procs = []

    verbose("creating")
  end

  def stop
    @status = :stopped
    @proc = []
    verbose("stopping")
  end

  def start
    @status = :running
    verbose("starting")
  end

  def suspend
    @status = :suspended
    verbose("suspending")
  end

  def reboot
    stop
    start
  end

  def run(pid, ram, cpu, hdd)
    @procs << { pid: pid, ram: ram, cpu: cpu, hdd: hdd }
    verbose("running process #{pid}")
  end

  def method_missing(m, *args, &block)
    params = (m.to_s.split('_'))
    return if params[1]!='usage'
    key = params[0].to_sym

    uso = 0
    @procs.each do |proceso|
      uso += proceso[key]
    end
    (uso / send(key) * 100.0).round(2)
  end

  def to_s
    out =  "  Nombre: #{@name} | SO: #{@os} | #{@status} | \n"
    out += "    * RAM: #{@ram} | #{ram_usage} % used |\n"
    out += "    * CPU: #{@cpu} | #{cpu_usage} % used |\n"
    out += "    * HDD: #{@hdd} | #{hdd_usage} % used"
    return out
  end

  def verbose(label)
    puts "VM #{label}..."
    puts to_s
  end
end


print("═════════════════\n")
print("Máquina virtual 1\n")
print("═════════════════\n")

vm1 = VirtualMachine.new('Minas Tirith', 8, 2.3, 380, 'ubuntu')
vm1.start()
vm1.run(1, 1.7, 0.3, 20)
vm1.run(4, 4, 0.9, 100)
vm1.run(7, 0.4, 1.1, 250)

vm1.stop

puts('═════════════════')
puts('Máquina virtual 2')
puts('═════════════════')

vm2 = VirtualMachine.new('Rohan', 6, 1.9, 250, 'debian')
vm2.start
vm2.run(2, 0.6, 0.7, 50)
vm2.run(5, 2.1, 0.2, 75)
vm2.run(8, 2.5, 0.4, 30)
vm2.stop

puts('═════════════════')
puts('Máquina virtual 3')
puts('═════════════════')

vm3 = VirtualMachine.new('Rivendel', 16, 3, 1000, 'opensuse')
vm3.start
vm3.run(3, 2, 1, 25)
vm3.run(6, 0.3, 0.5, 12)
vm3.run(9, 1.4, 0.8, 65)
vm3.stop()
