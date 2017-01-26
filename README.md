[![Build Status](https://travis-ci.org/fnchooft/digraph_simple.svg?branch=master)](https://travis-ci.org/fnchooft/digraph_simple)

# Digraphs Examples

As I am starting to get extremely interrested in Erlang, Elixir and Phoenix, 
i started to browse the web, and offcourse, since we are talking about
Erlang which is pretty old , but soooo cool we have a bunch of code which has
been battle-tested and hardened for many years.

This example show how to use an erlang module.

The example is basically taken from [here](http://easyerl.blogspot.com.br/2007/11/digraph-and-your-network-too-easy.html).

And get this, it was written on: *Sunday, November 18, 2007* with the title:

## Digraph and your network, too easy


I started the module like this:
```bash
mix new digraph
cd digraph
mkdir src
--- copy content from link into servers.erl - See the "Now the code" section.
mix compile
```

After this you can start iex like this so you get the environment:
```bash
iex -S mix
```

Now we can start playing with the library.
These are almost verbatim to what can be read in the blog-post from easyerl.


```elixir
iex(1)> dag = :digraph.new()
{:digraph, 90132, 94227, 98328, true}

iex(2)> :servers.add(dag, [:karoten,:ultraten,:muloaten])
:ok

iex(3)> :servers.connect(dag, :karoten, [:ultraten, {:muloaten, :http}])
:ok

iex(4)> :servers.links(dag, :karoten)                                   
[{:karoten, :ultraten, []}, {:karoten, :muloaten, :http}]

iex(5)> :digraph.get_path(dag,:karoten, :muloaten)
[:karoten, :muloaten]
```

This shows how easy it is to use the library.


## Installation

If [available in Hex](https://hex.pm/docs/publish), the package can be installed as:

  1. Add `digraphs` to your list of dependencies in `mix.exs`:

    ```elixir
    def deps do
      [{:digraphs, "~> 0.1.0"}]
    end
    ```

  2. Ensure `digraphs` is started before your application:

    ```elixir
    def application do
      [applications: [:digraphs]]
    end
    ```

