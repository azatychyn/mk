defmodule Mk.Feedback.Message do
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key {:id, :binary_id, autogenerate: true}
  @foreign_key_type :binary_id

  schema "messages" do
    field(:email, :string)
    field(:message, :string)
    field(:name, :string)
    field(:number, :string)
    field(:agree, :boolean, default: true)

    timestamps()
  end

  @doc false
  def changeset(message, attrs) do
    message
    |> cast(attrs, [:message, :name, :number, :email, :agree])
    |> validate_required([:message, :name, :agree])
    |> validate_required_inclusion([:email, :number])
    |> validate_agree()
  end

  def validate_required_inclusion(changeset, fields) do
    if Enum.any?(fields, &present?(changeset, &1)) do
      changeset
    else
      add_error(
        changeset,
        hd(fields),
        "Одно из этих полей должно быть заполнено: #{inspect(fields)}"
      )
    end
  end

  def validate_agree(changeset) do
    validate_change(changeset, :agree, fn :agree, agree ->
      if agree in [false, "false"] do
        [agree: "Должно быть заполнено для отправки формы"]
      else
        []
      end
    end)
  end

  defp present?(changeset, field) do
    value = get_field(changeset, field)
    value && value != ""
  end
end
