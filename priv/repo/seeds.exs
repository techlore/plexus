# Script for populating the database. You can run it as:
#
#     mix run priv/repo/seeds.exs
applications = [
  %{
    package: "com.agilebits.onepassword",
    name: "1Password",
    ratings: [
      %{
        id: "c51ce1cd-82f6-4c0b-8298-512ecb424b7b",
        application_package: "com.agilebits.onepassword",
        application_version: "7.9.2",
        application_build_number: 70_902_003,
        google_lib: :none,
        score: 3,
        notes: "No notifications"
      }
    ]
  },
  %{
    package: "com.spotify.music",
    name: "Spotify",
    ratings: [
      %{
        id: "7c86dda9-d123-42f7-bbe0-fb05ee0358ae",
        application_package: "com.spotify.music",
        application_version: "8.7.36.905",
        application_build_number: 998,
        google_lib: :none,
        score: 2,
        notes: nil
      },
      %{
        id: "452e385c-56ca-4820-ade3-c977005339e2",
        application_package: "com.spotify.music",
        application_version: "8.7.36.905",
        application_build_number: 998,
        google_lib: :micro_g,
        score: 4,
        notes: nil
      },
      %{
        id: "3a8a83e9-877c-47fe-b283-d3e47aaabbee",
        application_package: "com.spotify.music",
        application_version: "8.7.2.1205",
        application_build_number: 767,
        google_lib: :none,
        score: 4,
        notes: nil
      }
    ]
  },
  %{
    package: "com.google.android.youtube",
    name: "YouTube",
    ratings: [
      %{
        id: "7e353bf6-e951-4972-a187-33523ed00fd7",
        application_package: "com.google.android.youtube",
        application_version: "17.22.36",
        application_build_number: 88_902_003,
        google_lib: :none,
        score: 1,
        notes: "Unusable"
      },
      %{
        id: "02b0d86d-3e8b-4aea-a7d3-945146d9212e",
        application_package: "com.google.android.youtube",
        application_version: "17.22.36",
        application_build_number: 88_902_003,
        google_lib: :micro_g,
        score: 4,
        notes: nil
      }
    ]
  },
  %{
    package: "com.yubico.authenticator",
    name: "Yubico Authenticator",
    ratings: [
      %{
        id: "9f17708c-1f47-4f31-b200-1405ef22fa9b",
        application_package: "com.yubico.authenticator",
        application_version: "2.2.0",
        application_build_number: 20199,
        google_lib: :none,
        score: 3,
        notes: nil
      },
      %{
        id: "d90d03cf-4d95-43c9-90be-9670c0f38842",
        application_package: "com.yubico.authenticator",
        application_version: "2.2.0",
        application_build_number: 20199,
        google_lib: :micro_g,
        score: 4,
        notes: nil
      }
    ]
  }
]

for application <- applications do
  Plexus.Applications.upsert_application!(application)
end
