class ProcLearn
  def do_some_block
    block_demo(1, "Hello") do | arg1, arg2 |
      p "  Inside do_some_block"
      p "    #{arg1}  #{arg2} "
    end
  end

  def do_some_proc
    my_proc = Proc.new() do |param1, param2|
      p " Inside of Proc"
      #p arg1 = param1 * 10
      #p arg2 = param2.reverse!
      #p param1 * 10
      #p param2.reverse!
    end
    proc_demo(my_proc)

  end

  private
  def block_demo(param1, param2, &block)
    p "Inside block_demo"
    arg1 = param1 + 1
    arg2 = "#{param2} world"
    yield arg1, arg2
  end

  def proc_demo(some_proc)
    p "Inside proc_demo"
    some_proc.call()
  end
end

ProcLearn.new.do_some_block
ProcLearn.new.do_some_proc
