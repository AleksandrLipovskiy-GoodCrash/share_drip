defmodule ShareDrip.Storage.Provider do
  @moduledoc false

  @target Application.compile_env(:share_drip, :storage_provider)
  @defdelegate upload(path, content), to: @target
  @defdelegate download(path, content), to: @target
end
