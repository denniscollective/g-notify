require 'pp'
require 'rubygems'
require 'notify'

module Kernel
  def g(*args, &block)
    args.push(block) if block
    messages =
      if args.empty?
        ['g!']
      else
        args.map { |i| i.pretty_inspect }
      end

    messages.each { |i| Notify.notify 'g', i}

    if args.empty?
      nil
    elsif args.size == 1
      args.first
    else
      args
    end
  end
end
