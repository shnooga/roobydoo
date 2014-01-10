class RegEx
  LOREM_IPSUM = <<-eos
Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut
labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris
nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate
velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non
proident, sunt in culpa qui officia deserunt mollit anim id est laborum.
  eos

  def find_ipsum
    index = LOREM_IPSUM =~ /ipsum/
    p "ipsum found at #{index}"
  end
end

RegEx.new.find_ipsum