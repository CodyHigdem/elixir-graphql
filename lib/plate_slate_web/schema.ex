#---
# Excerpted from "Craft GraphQL APIs in Elixir with Absinthe",
# published by The Pragmatic Bookshelf.
# Copyrights apply to this code. It may not be used to create training material,
# courses, books, articles, and the like. Contact us if you are in doubt.
# We make no guarantees that this code is fit for any purpose.
# Visit http://www.pragmaticprogrammer.com/titles/wwgraphql for more book information.
#---
defmodule PlateSlateWeb.Schema do
  use Absinthe.Schema

  alias PlateSlate.{Menu, Repo}


  #
  # Absinthe.Schema.lookup_type(PlateSlateWeb.Schema, ​"​​RootQueryType"​)
  #
  query do
    # list_of Absinth macro that can use to indicate a field returns a list of a specific type
    # menuItems is the GraphQL convention, Absinth converts this

    @desc "The list of available items on the menu"
    field :menu_items, list_of(:menu_item), description: "The list of available items on the menu" do

      resolve fn _,_,_ ->
        {:ok, Repo.all(Menu.Item)} #PlateSlate.Repo.all(PlateSlate.Menu.Item)
      end
    end

  end

  object :menu_item do
    '''
      Adding a field to an objecty type is as simple as using the 'field' macro
      the macro takes an identifier atom, a type reference, optional keywoard list of attributes
      and an optional block for more in-depth configuration
    '''
    field :id, :id
    field :name, :string
    field :description, :string
  end
end
