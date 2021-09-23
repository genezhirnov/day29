defmodule Empower2 do

@summary_prompt "Your result is: "

  @moduledoc """
  Documentation for `Empower2`.
  """

  @doc """
  Hello world.

  ## Examples

      iex> Empower2.hello()
      :world

  """
  # def hello do
  #   :world
  # end
  # def hello, do: :world
  def repeat_after_me(words) do
    # "You said: " <> words
    var = """
    You said: #{words}
    """    
  end

  def build_a_holiday(holiday_name, representative) do
    %Holiday{
      name: holiday_name,
      representative: representative
    }
  end

  def am_i_4?(the_number \\ 4)
  def am_i_4?(the_number) when is_integer(the_number) and the_number == 4, do: true
  def am_i_4?(the_number) when is_binary(the_number) do
    "Obviously not, do you know numbers? like 1, 2, 3?"
  end
  def am_i_4?(_), do: false
  # def am_i_4?(4), do: true
  # def am_i_4?(_), do: false

  def match_me(%{apples: 3}), do: "just 3?"
  def match_me(%{apples: 55}), do: "YES! now I won't go hungry tonight"
  def match_me(basket = %{apples: apple_count}) when is_integer(apple_count) do
    pears = Map.get(basket, :pears, 0)
    "You've got #{apple_count} apples in your #{IO.inspect(basket)} and #{pears} pears"
  end
  def match_me(basket), do: "How dare you present yourself #{inspect(basket)} with a basket devoid of apples :("

  def match_me(basket \\ %{apples: 55}) do
    switch(basket.apples) {
      case 3:
        return "just 3?";
      case 55: 
        return "blah blah...";
      default:
        return "How dare you present yourself with a basket devoid of apples :(";  
    }
    #
  #   match_result = 
  #     case basket do
  #       %{apples: 3} -> 
  #         "just 3?"
  #       %{apples: 55} ->
  #         "YES! now I won't go hungry tonight"
  #       %{apples: apple_count} ->
  #         "You've got #{apple_count} apples, but I don't care how many"
  #       _ ->
  #         "How dare you present yourself #{inspect(basket)} with a basket devoid of apples :("
  #     end
  #   "the result is: #{match_result}"
  # end

  def match_me2(basket \\ %{apples: 55}) do
    apple_count = Map.get(basket, :apples)
    cond do
      !Map.has_key?(basket, :apples) -> 
        "How dare you present yourself with a basket devoid of apples :("
      apple_count == 55 ->
        "YES! now I won't go hungry tonight"
      apple_count < 10 ->
        "Please go pick up some more"
      true ->
        "You've got some apples for me, thanks!"
    end
  end


  def build_a_map(one, two, three, four) do
    %{}
    |> Map.put("first", one)
    |> Map.put("second", two)
    |> Map.put("third", three)
    |> Map.put("fourth", four)
    # |> Map.get("third")
  end

# @summary_prompt "Your result is"
  def do_it(%{
      num1: a, 
      num2: b, 
      summary_prompt: summary_prompt
    }) do
  # def do_it(num1, num2, summary_prompt \\ @summary_prompt) do
    # result = mult_2_nums(add_two_numbers(num1, num2), num2)
    # result = num1
    #   |> add_two_numbers(num2)
    #   |> mult_2_nums(num2)
    # "#{summary_prompt} #{result}"
    # result = add_two_numbers(num1, num2)
    # result2 = mult_2_nums(num1, num2)
    # "#{summary_prompt} #{result + result2}"
    "#{summary_prompt} #{add_two_numbers(a, b) |> mult_2_nums(b)}"
  end

  defp add_two_numbers(x, y), do: x + y

  defp mult_2_nums(num1, num2), do: num1 * num2

  def show_me_the_list_elements(list), do: do_show_list(list)

  defp do_show_list([]), do: IO.puts("DONE!")
  defp do_show_list([this_is_the_head | snake_tail]) do
    IO.puts("Our element is [#{this_is_the_head}] and there are #{
      Enum.count(snake_tail)} items left in the tail")
    do_show_list(snake_tail)
  end

end




















