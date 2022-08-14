# Script for populating the database. You can run it as:
#
#     mix run priv/repo/seeds.exs
{:ok, _admin_user} =
  Plexus.Accounts.register_user(%{
    username: "admin",
    password: "admin",
    role: :admin
  })

{:ok, _developer_user} =
  Plexus.Accounts.register_user(%{
    username: "developer",
    password: "developer",
    role: :developer
  })

applications = [
  %{
    id: "5c369728-3ed1-48b5-920e-88bff883caa1",
    name: "1Password",
    package: "com.agilebits.onepassword",
    ratings: [
      %{
        id: "c51ce1cd-82f6-4c0b-8298-512ecb424b7b",
        application_id: "5c369728-3ed1-48b5-920e-88bff883caa1",
        application_version: "7.9.2",
        application_build_number: 70_902_003,
        status: :approved,
        google_lib: :none,
        rating: 3,
        notes: "No notifications"
      }
    ]
  },
  %{
    id: "28493c7c-e981-47d1-a3b6-18e28499aa3f",
    name: "Spotify",
    package: "com.spotify.music",
    ratings: [
      %{
        id: "7c86dda9-d123-42f7-bbe0-fb05ee0358ae",
        application_id: "28493c7c-e981-47d1-a3b6-18e28499aa3f",
        application_version: "8.7.36.905",
        application_build_number: 998,
        status: :approved,
        google_lib: :none,
        rating: 4,
        notes: nil
      },
      %{
        id: "452e385c-56ca-4820-ade3-c977005339e2",
        application_id: "28493c7c-e981-47d1-a3b6-18e28499aa3f",
        application_version: "8.7.36.905",
        application_build_number: 998,
        status: :approved,
        google_lib: :micro_g,
        rating: 4,
        notes: nil
      },
      %{
        id: "3a8a83e9-877c-47fe-b283-d3e47aaabbee",
        application_id: "28493c7c-e981-47d1-a3b6-18e28499aa3f",
        application_version: "8.7.2.1205",
        application_build_number: 767,
        status: :approved,
        google_lib: :none,
        rating: 4,
        notes: nil
      }
    ]
  },
  %{
    id: "7d71ed83-5625-4fe6-8934-5c6904ee070c",
    name: "YouTube",
    package: "com.google.android.youtube",
    ratings: [
      %{
        id: "7e353bf6-e951-4972-a187-33523ed00fd7",
        application_id: "7d71ed83-5625-4fe6-8934-5c6904ee070c",
        application_version: "17.22.36",
        application_build_number: 88_902_003,
        status: :approved,
        google_lib: :none,
        rating: 1,
        notes: "Unusable"
      },
      %{
        id: "02b0d86d-3e8b-4aea-a7d3-945146d9212e",
        application_id: "7d71ed83-5625-4fe6-8934-5c6904ee070c",
        application_version: "17.22.36",
        application_build_number: 88_902_003,
        status: :approved,
        google_lib: :micro_g,
        rating: 4,
        notes: nil
      }
    ]
  },
  %{
    id: "25a2329f-5d7e-4e0d-a3c3-0815ed83e509",
    name: "Yubico Authenticator",
    package: "com.yubico.authenticator",
    ratings: [
      %{
        id: "9f17708c-1f47-4f31-b200-1405ef22fa9b",
        application_id: "25a2329f-5d7e-4e0d-a3c3-0815ed83e509",
        application_version: "2.2.0",
        application_build_number: 20199,
        status: :approved,
        google_lib: :none,
        rating: 4,
        notes: nil
      },
      %{
        id: "d90d03cf-4d95-43c9-90be-9670c0f38842",
        application_id: "25a2329f-5d7e-4e0d-a3c3-0815ed83e509",
        application_version: "2.2.0",
        application_build_number: 20199,
        status: :approved,
        google_lib: :micro_g,
        rating: 4,
        notes: nil
      }
    ]
  }
]

for application <- applications do
  Plexus.Applications.upsert_application!(application)
end
