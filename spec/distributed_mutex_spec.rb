require 'spec_helper'

describe DistributedMutex do
  it 'has a version number' do
    expect(DistributedMutex::VERSION).not_to be nil
  end

  it 'will initialize' do
    test = nil

    DistributedMutex.new("key").synchronize do
      test = "1"
    end

    expect(test).to eq("1")
  end

  it 'will run one after another if the key matches' do
    threads = []

    threads << Thread.new {
      DistributedMutex.new("key").synchronize do
        sleep 1
        Thread.current[:time] = DateTime.now
      end
    }

    sleep 0.1 # delay is here to make sure the first thread starts first

    threads << Thread.new {
      DistributedMutex.new("key").synchronize do
        sleep 1
        Thread.current[:time] = DateTime.now
      end
    }

    # wait for them all to finish
    threads.each { |thr| thr.join }

    expect(threads[0][:time].strftime('%s').to_i).to be < threads[1][:time].strftime('%s').to_i
  end

  it 'will run at the same time if the key is different' do
    threads = []

    threads << Thread.new {
      DistributedMutex.new("key1").synchronize do
        sleep 1
        Thread.current[:time] = DateTime.now
      end
    }

    sleep 0.1 # delay is here to make sure the first thread starts first

    threads << Thread.new {
      DistributedMutex.new("key2").synchronize do
        sleep 1
        Thread.current[:time] = DateTime.now
      end
    }

    # wait for them all to finish
    threads.each { |thr| thr.join }

    expect(threads[0][:time].strftime('%s').to_i).to eq threads[1][:time].strftime('%s').to_i
  end
end
