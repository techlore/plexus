defmodule PlexusWeb.SessionHTML do
  use PlexusWeb, :html

  def new(assigns) do
    ~H"""
    <div class="bg-white py-8 sm:py-16">
      <div class="text-center">
        <h2 class="text-xl font-semibold tracking-tight text-balance text-gray-900">
          Log in to your account
        </h2>
      </div>

      <.simple_form class="max-w-md mx-auto" for={%{}} action={OneAuth.login_path(@conn)}>
        <div class="flex flex-col space-y-3">
          <input
            id="username"
            type="text"
            name="username"
            placeholder="Username"
            autocomplete="username"
            aria-label="Username"
            class="bg-gray-600/5 p-3"
            required
          />

          <input
            id="password"
            type="password"
            name="password"
            placeholder="Password"
            autocomplete="current-password"
            aria-label="Password"
            class="bg-gray-600/5 p-3"
            required
          />
        </div>
        <:actions>
          <.button class="w-full" phx-disable-with="Logging in...">Log in</.button>
        </:actions>
      </.simple_form>
    </div>
    """
  end
end
