class ProcLearn
  UNO = 1.freeze
  HELLO = "Hello".freeze
  WORLD = "World".freeze

  # Blocks are for one time usage
  def do_some_block
    block_demo(UNO, HELLO) do | arg1, arg2 |
      p "  Inside do_some_block"
      p "    #{arg1}  #{arg2} "
    end
  end

  # Procs allow code reuse
  def do_some_proc
    my_proc = Proc.new() do |arg1, arg2|
      p " Inside of Proc"
      p "    #{arg1}  #{arg2} "
    end

    proc_demo(UNO, HELLO, my_proc) # Call 1st time
    proc_demo(UNO, WORLD, my_proc) # Call 2nd time
  end

  private
  def block_demo(param1, param2, &block)
    p "Inside block_demo"
    arg1 = param1 + 1
    arg2 = "#{param2} world"
    yield arg1, arg2
  end

  def proc_demo(param1, param2, some_proc)
    p "Inside proc_demo"
    arg1 = param1 * 10
    arg2 = param2.reverse
    some_proc.call(arg1, arg2)
  end
end

ProcLearn.new.do_some_block
ProcLearn.new.do_some_proc
