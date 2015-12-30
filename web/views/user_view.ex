defmodule DoTheCount.UserView do
  use DoTheCount.Web, :view

  def translate_error({msg, opts}) do
    String.replace(msg, "%{count}", to_string(opts[:count]))
  end

  def translate_error(msg), do: msg

end
