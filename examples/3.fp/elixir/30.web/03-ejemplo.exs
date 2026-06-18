#!/usr/bin/env elixir

children = [
  TCP.Pool,
  {TCP.Acceptor, port: 4040}
]

Supervisor.start_link(children, strategy: :one_for_one)
