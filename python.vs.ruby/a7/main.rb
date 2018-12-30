#!/usr/bin/ruby

class VirtualMachine
  def initilize(name, ram=1, cpu=1.3, hdd=100, os="debian")
    @name = name
    @ram = ram.to_f
    @cpu = cpu.to_f
    @hdd = hdd.to_f
    @os = os

    @status = :stopped
    @procs = []
  end

  def stop
    @status = :stopped
    @proc = []
  end

  def start
    @status = :running
  end

  def suspend
    @status = :suspended
  end

  def reboot
    stop
    start
  end

  def run(pid, ram, cpu, hdd)
    @procs << { pid: pid, ram: ram, cpu: cpu, hdd: hdd }
    puts " -Ejecutamos el proceso #{pid}"
  end

  def ram_usage
    uso_ram = 0
    @procs.each do |proceso|
      uso_ram += proceso[:ram]
    end
    (uso_ram / @ram * 100.0).round(2)
  end

  def cpu_usage
    uso_cpu = 0
    @procs.each do |proceso|
      uso_cpu += proceso[:cpu]
    end
    (uso_cpu / self.cpu * 100.0).round(2)
  end

  def hdd_usage
    uso_hdd = 0
    @procs.each do |proceso|
      uso_cpu += proceso[:hdd]
    end
    (uso_hdd / self.hdd * 100.0).round(2)
  end

  def to_s
    print "Nombre: #{@name} | SO: #{@os} | #{@status} | "
    print "RAM: #{@ram} | CPU: #{@cpu} | HDD: #{@hdd} | "
    print "#{ram_usage} % RAM used | "
    print "#{cpu_usage} % CPU used | "
    print "#{hdd_usage} % HDD used\n"
  end
end


   print('═════════════════')
   print('Máquina virtual 1')
   print('═════════════════')
   print('1. Creamos la máquina virtual Minas Tirith')
   vm1 = VirtualMachine('Minas Tirith', 8, 2.3, 380, 'ubuntu')
   print(vm1)
   print('2. Arrancamos la máquina virtual')
   vm1.start()
   print(vm1)
   print('3. Lanzamos los procesos 1, 4 y 7')
   vm1.run(1, 1.7, 0.3, 20)
   vm1.run(4, 4, 0.9, 100)
   vm1.run(7, 0.4, 1.1, 250)
   print(vm1)
   print('4. Paramos la máquina virtual')
   vm1.stop()
   print(vm1)
   print(' ')

   print('═════════════════')
   print('Máquina virtual 2')
   print('═════════════════')
   print('1. Creamos la máquina virtual Rohan')
   vm2 = VirtualMachine ('Rohan', 6, 1.9, 250, 'debian')
   print(vm2)
   print('2. Arrancamos la máquina virtual')
   vm2.start()
   print(vm2)
   print('3. Lanzamos los procesos 2, 5 y 8')
   vm2.run(2, 0.6, 0.7, 50)
   vm2.run(5, 2.1, 0.2, 75)
   vm2.run(8, 2.5, 0.4, 30)
   print(vm2)
   print('4. Paramos la máquina virtual')
   vm2.stop()
   print(vm2)
   print(' ')

   print('═════════════════')
   print('Máquina virtual 3')
   print('═════════════════')
   print('1. Creamos la máquina virtual Rivendel')
   vm3 = VirtualMachine ('Rivendel', 16, 3, 1000, 'opensuse')
   print(vm3)
   print('2. Arrancamos la máquina virtual')
   vm3.start()
   print(vm3)
   print('3. Lanzamos los procesos 3, 6 y 9')
   vm3.run(3, 2, 1, 25)
   vm3.run(6, 0.3, 0.5, 12)
   vm3.run(9, 1.4, 0.8, 65)
   print(vm3)
   print('4. Paramos la máquina virtual')
   vm3.stop()
   print(vm3)
