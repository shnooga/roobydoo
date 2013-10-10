class LambdaProc
  def do_some_proc
    proc_sample(1, "Hello") do | arg1, arg2 |
      p "Inside do_some_proc"
      p arg1
      p arg2
    end

  end

  def proc_sample(param1, param2, &block)
    p "Inside proc_sample"
    arg1 = param1 + 1
    arg2 = "#{param2} world"
    yield arg1, arg2
  end
end


lambda_proc = LambdaProc.new
lambda_proc.do_some_proc
