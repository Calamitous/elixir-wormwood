defmodule Wormwood.Library.Operation do
  @enforce_keys [:library_module, :source_module, :document]
  defstruct [:library_module, :source_module, :document]

  @doc false
  def compile!(
        env,
        _library = %Wormwood.Library{module: library_module},
        document = %Wormwood.Language.Document{definitions: [%Wormwood.Language.OperationDefinition{} | _fragments]}
      ) do
    # input = compile_input!(env, library, operation_definition)
    %__MODULE__{library_module: library_module, source_module: env.module, document: document}
  end

  @doc false
  def coerce_input!(operation = %__MODULE__{}, input) when is_map(input) do
    Wormwood.Library.Operation.Input.coerce!(operation, input)
  end

  @doc false
  def coerce_result!(operation = %__MODULE__{}, result) when is_map(result) do
    Wormwood.Library.Operation.Result.coerce!(operation, result)
  end
end
