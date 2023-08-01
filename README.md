# Jogo de Batalha em Turnos - Elixir

Este é um jogo simples baseado em turnos, onde você, como jogador, enfrentará o computador em uma batalha. Ambos começam com 100 pontos de vida, e a cada rodada, você e o computador podem escolher entre três movimentos:

- Ataque Moderado: Causa entre 18 e 25 pontos de dano ao adversário.
- Ataque Variado: Causa entre 10 e 35 pontos de dano ao adversário.
- Poder de Cura: Cura entre 18 e 25 pontos de vida.

Após cada movimento, a tela exibirá o que aconteceu na rodada e a situação atual de cada jogador. O jogo continua até que um dos jogadores fique com 0 pontos de vida.

O jogador humano pode escolher o nome do seu personagem e nomear seus três movimentos. O objetivo é derrotar o computador utilizando estratégias de ataque e cura.

Lembre-se que o jogo não exibirá valores negativos de vida quando um dos jogadores perder, e a vitória será concedida ao último jogador a permanecer com pontos de vida.


## Atributos dos Jogadores

Cada jogador possui os seguintes atributos:

```elixir
 defmodule ExMon.Player do
   @required_keys [:life, :name, :moves]
   @max_life 100
   @enforce_keys @required_keys
 
   defstruct @required_keys
 
   def build(name, move_rnd, move_avg, move_heal) do
     %ExMon.Player{
       life: @max_life,
       name: name,
       moves: %{
         move_rnd: move_rnd,
         move_avg: move_avg,
         move_heal: move_heal
       }
     }
   end
 end
```

## Como Jogar
Com o Elixir já instalado, faça um git clone do projeto, entre em sua pasta e execute pelo iex
```bash
iex -S mix
```

Crie um jogador:
```elixir
iex(1)> player = ExMon.create_player("Nome", :kick, :punch, :heal)
```
Inicie o jogo:
```elixir
iex(2)> ExMon.start_game(player)
```
Faça os movimentos passando os atoms correspondentes (no exemplo é passado o movimento :punch):
```elixir
iex(3)> ExMon.make_move(:punch)
```
