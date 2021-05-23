defmodule Foo.RMQPublisher do
  @behaviour GenRMQ.Publisher

  @rmq_uri "amqp://guest:guest@rabbitmq:5672"
  @exchange "example_exchange"
  @queue "simple_queue"

  def init do
    [
      uri: @rmq_uri,
      queue: @queue,
      exchange: @exchange
    ]
  end

  def start_link do
    GenRMQ.Publisher.start_link(__MODULE__, name: __MODULE__)
  end

  def publish_message(message, routing_key) do
    IO.puts("Publishing message #{inspect(message)}")
    GenRMQ.Publisher.publish(__MODULE__, message, routing_key)
  end
end
