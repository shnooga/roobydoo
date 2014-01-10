class ProcLearn
  UNO = 1.freeze
  HELLO = "Hello".freeze
  WORLD = "World".freeze

  # Blocks are for one time usage
  def do_some_block
    block_demo(UNO, HELLO) do | out_arg1, out_arg2 |
      p "  Inside do_some_block"
      p "    #{out_arg1}  #{out_arg2} "
    end
  end

  # Procs allow code reuse
  def do_some_proc
    my_proc = Proc.new() do |out_arg1, out_arg2|
      p " Inside of Proc"
      p "    #{out_arg1}  #{out_arg2} "
    end

    proc_demo(UNO, HELLO, my_proc) # Call 1st time
    proc_demo(UNO, WORLD, my_proc) # Call 2nd time
  end

  def do_some_lambda
    my_proc = Proc.new() do |out_arg1, out_arg2|
      p " Inside of Proc"
      p "    #{out_arg1}  #{out_arg2} "
    end

    lambda_demo(UNO, HELLO, my_proc) # Call 1st time
    lambda_demo(UNO, WORLD, my_proc) # Call 2nd time
  end

  private
  def block_demo(param1, param2, &block)
    p "Inside block_demo"
    out_arg1 = param1 + 1
    out_arg2 = "#{param2} world"
    yield out_arg1, out_arg2
  end

  def proc_demo(param1, param2, some_proc)
    p "Inside proc_demo"
    out_arg1 = param1 * 10
    out_arg2 = param2.reverse
    some_proc.call(out_arg1, out_arg2)
  end

  def lambda_demo(param1, param2, some_proc)
    p "Inside lambda demo"
    out_arg1 = param1 * 111
    out_arg2 = param2.upcase
    some_proc.call(out_arg1, out_arg2)
  end
end

ProcLearn.new.do_some_block
ProcLearn.new.do_some_proc
ProcLearn.new.do_some_lambda
