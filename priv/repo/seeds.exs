# Script for populating the database. You can run it as:
#
#     mix run priv/repo/seeds.exs
#
# Inside the script, you can read and write to any of your
# repositories directly:
#
#     Plexus.Repo.insert!(%Plexus.SomeSchema{})
#
# We recommend using the bang functions (`insert!`, `update!`
# and so on) as they will fail if something goes wrong.
alias Plexus.Schemas.App

for params <- [
      %{
        package: "com.beemdevelopment.aegis",
        name: "Aegis",
        icon_url:
          "https://play-lh.googleusercontent.com/qDzsOmoRT9o6QTElCaRJElAtfYW-nnOadwIInb6bXSEKexB211SsEtSeZrF5xm_lKUY"
      },
      %{
        package: "com.aurora.store",
        name: "Aurora Store",
        icon_url:
          "https://f-droid.org/repo/com.aurora.store/en-US/icon_tbAhwq51NNd0liZcTg0cQNNvazxrWlj7bPCe_1TkCV8=.png"
      },
      %{
        package: "com.x8bit.bitwarden",
        name: "Bitwarden",
        icon_url:
          "https://play-lh.googleusercontent.com/-jz18EgBYlmeHlnsq_iltq6uLnYFtXAVR_gi_d0qEj0pANQ1MtrJIstJoCQtImlWKwc"
      },
      %{
        package: "org.thoughtcrime.securesms",
        name: "Signal",
        icon_url:
          "https://play-lh.googleusercontent.com/jCln_XT8Ruzp7loH1S6yM-ZzzpLP1kZ3CCdXVEo0tP2w5HNtWQds6lo6aLxLIjiW_X8"
      },
      %{
        package: "com.google.android.youtube",
        name: "YouTube",
        icon_url:
          "https://play-lh.googleusercontent.com/lMoItBgdPPVDJsNOVtP26EKHePkwBg-PkuY9NOrc-fumRtTFP4XhpUNk_22syN4Datc"
      }
    ] do
  app =
    case Plexus.Repo.get(App, params.package) do
      nil -> %App{package: params.package}
      app -> app
    end

  app
  |> App.changeset(params)
  |> Plexus.Repo.insert_or_update!()
end
