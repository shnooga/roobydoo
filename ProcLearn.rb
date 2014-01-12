class ProcLearn
  UNO = 1.freeze
  DOS = 2.freeze
  HELLO = "Hello".freeze
  WORLD = "World".freeze

  # Blocks are for one time usage
  def do_some_block
    block_demo(UNO, HELLO) do | out_arg1, out_arg2 |
      p " Inside do_some_block"
      p "    #{out_arg1}  #{out_arg2} "
    end
  end

  # Procs allow code reuse
  def do_some_proc
    my_proc = Proc.new() do |out_arg1, out_arg2|
      p " Inside of Proc"
      p "    #{out_arg1}  #{out_arg2} "
      return # This will force the calling method to return also.
    end

    proc_demo(UNO, HELLO, my_proc) # Call 1st time
    proc_demo(DOS, WORLD, my_proc) # Call 2nd time will not be reached due to the return in my_proc
  end

  def do_some_lambda
    my_lambda = lambda do |out_arg1, out_arg2|
      p " Inside of Lambda"
      p "    #{out_arg1}  #{out_arg2} "
      return # Has no effect on the calling method.j:41
    end

    lambda_demo(UNO, HELLO, my_lambda) # Call 1st time
    lambda_demo(DOS, WORLD, my_lambda) # Call 2nd time
  end

  private
  def block_demo(param1, param2, &block)
    p "Inside block_demo"
    out_arg1 = param1 + 0.0100111
    out_arg2 = "#{param2} world"
    yield out_arg1, out_arg2
  end

  def proc_demo(param1, param2, some_proc)
    p "Inside proc_demo"
    out_arg1 = param1 * 10
    out_arg2 = param2.reverse
    some_proc.call(out_arg1, out_arg2)
  end

  def lambda_demo(param1, param2, some_lambda)
    p "Inside lambda demo"
    out_arg1 = param1 * 111
    out_arg2 = param2.upcase
    some_lambda.call(out_arg1, out_arg2)
  end
end

ProcLearn.new.do_some_block
ProcLearn.new.do_some_proc
ProcLearn.new.do_some_lambda
