defmodule Identicon do

  def main(input) do
  input
  |> hash_input
  |> pick_color
  |> build_grid
  |> filter_odd

  end

  def filter_odd (%Identicon.Image{
    grid: grid ,hex: hex
  }) do

  new_grid= Enum.filter(grid, fn {code , _index} -> rem(code,2) == 0   end)


  %Identicon.Image { grid: new_grid , hex: hex }

  end



  def hash_input(input) do
   hex = :crypto.hash(:md5,input)
    |> :binary.bin_to_list

    %Identicon.Image{
     hex: hex
    }

  end


  def build_grid(%Identicon.Image{hex: hex}) do
    grid= hex
        |> Enum.chunk_every(3, 2, :discard)
        |> Enum.map(&mirror_grid/1)
        |> List.flatten
        |> Enum.with_index

        %Identicon.Image{
         hex: hex ,  grid: grid
        }
  end
#


def mirror_grid (chunk_list) do
   [a,b |_others]=chunk_list
    chunk_list ++ [b ,a]
  end

def pick_color( %Identicon.Image { hex: [r,g,b | _tail] }= hex) do
  %Identicon.Image {
    hex | color: {r,g,b}
  }
end



end
