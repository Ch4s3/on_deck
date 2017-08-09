defmodule OnDeck.Recipes.BeerXmlParser do
  import SweetXml
  @moduledoc """
  Parses BeerXML formattted xml and returns a map that can be saved to a `OnDeck.Recipes.Beer`
    
  ##Examples
      iex> {:ok, xml} = File.read("test/fixtures/session_ipa.xml")
      ...> {:ok, ingredients} = OnDeck.Recipes.BeerXmlParser.parse(xml)
      ...> List.first(ingredients.hops)
      %{alpha: '12.0000000', ammount: nil, display_ammount: nil,
        display_time: '45.0 min', hop_use: 'Boil', name: 'Citra', origin: 'U.S.',
        time: '45.0000000'}
  """
  @spec parse(String.t) :: {:ok, %{}} | {:error, String.t}
  def parse(_xml_string = ""), do: {:error, "No XML present"}
  def parse(_xml_string = nil), do: {:error, "No XML present"}
  def parse(xml_string) do
    xml_string
      |> build_ingredients_list
  end
  def build_ingredients_list(xml_string) do

    try do
      {:ok,
        %{
          meta: %{},
          hops: get_hops(xml_string),
          fermentables: [%{}],
          yeasts: [%{}],
          misc: [%{},
          equipment: %{},
          mash: %{}]
        }
      }
    catch
      _, _e -> {:error, "Error parsing xml"}
    end
  end

  def get_hops(xml) do
    xml 
    |> xpath(~x"/RECIPES/RECIPE/HOPS/HOP"l, 
        name: ~x"NAME/text()", 
        origin: ~x"ORIGIN/text()",
        alpha: ~x"ALPHA/text()",
        ammount: ~x"AMMOUNT/text()",
        display_ammount: ~x"DISPLAY_AMMOUNT/text()",
        hop_use: ~x"USE/text()",
        time: ~x"TIME/text()",
        display_time: ~x"DISPLAY_TIME/text()")
  end
end