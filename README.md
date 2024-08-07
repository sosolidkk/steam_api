
# Summary
- [Summary](#summary)
- [steam\_api](#steam_api)
  - [Installation](#installation)
  - [Usage](#usage)
    - [Configuring the client](#configuring-the-client)
    - [Authorization](#authorization)
    - [GetNewsForApp (v0002)](#getnewsforapp-v0002)
    - [GetGlobalAchievementPercentagesForApp (v0002)](#getglobalachievementpercentagesforapp-v0002)
    - [GetPlayerSummaries (v0002)](#getplayersummaries-v0002)
    - [GetFriendList (v0001)](#getfriendlist-v0001)
    - [GetPlayerAchievements (v0001)](#getplayerachievements-v0001)
    - [GetUserStatsForGame (v0002)](#getuserstatsforgame-v0002)
    - [GetOwnedGames (v0001)](#getownedgames-v0001)
    - [GetRecentlyPlayedGames (v0001)](#getrecentlyplayedgames-v0001)
    - [ResolveVanityURL (v0001)](#resolvevanityurl-v0001)
    - [GetNumberOfCurrentPlayers (v0001)](#getnumberofcurrentplayers-v0001)
    - [GetSteamLevel (v0001)](#getsteamlevel-v0001)
    - [App Details](#app-details)
  - [Development](#development)
    - [Requirements](#requirements)
    - [Initial setup](#initial-setup)
    - [Interactive console](#interactive-console)
    - [Running specs](#running-specs)
  - [Code quality](#code-quality)
    - [Analyzing the code](#analyzing-the-code)
  - [Contributing](#contributing)
  - [License](#license)
  - [Code of Conduct](#code-of-conduct)

# steam_api

A project for fetching information from [Steam Web Api](https://developer.valvesoftware.com/wiki/Steam_Web_API).

## Installation

Install the gem and add to the application's Gemfile by executing:

```bash
$ bundle add steam-interface
```

If bundler is not being used to manage dependencies, install the gem by executing:

```bash
$ gem install steam-interface
```

And then execute:

```bash
$ bundle install
```

## Usage

Almost all use of the Steam Web API requires the use of an API Key. You can acquire one [by filling out this form](https://steamcommunity.com/dev/apikey).

### Configuring the client

Just use the following snippet to configure the client:

```ruby
SteamApi::Client.configure do |config|
  config.api_token = 'your-API-token-value'
end
```

### Authorization

After having the token, you can initialize the client like the configuring section, or if you want a standalone usage, you can do it this way:

```ruby
client = SteamApi::Client.new('dev-api-token')
```

Some endpoints don't need an API Key, so you can use the client without providing any. You can find which in the next section.

### [GetNewsForApp (v0002)](https://developer.valvesoftware.com/wiki/Steam_Web_API#GetNewsForApp_.28v0002.29)
> GetNewsForApp returns the latest of a game specified by its appID.
- Arguments
  - **appid**: AppID of the game you want the news of.
  - **count**: How many news enties you want to get returned.
  - **maxlength**: Maximum length of each news entry. Defaults to 300

```ruby
client = SteamApi::Client.new
client.app_news.retrieve(400, 3, 300)
```

### [GetGlobalAchievementPercentagesForApp (v0002)](https://developer.valvesoftware.com/wiki/Steam_Web_API#GetGlobalAchievementPercentagesForApp_.28v0002.29)
> Returns a global achievements overview of a specific game in percentages.
- Arguments
  - **gameid**: AppID of the game you want the news of.

```ruby
client = SteamApi::Client.new
client.app_global_achievements.retrieve(440)
```

### [GetPlayerSummaries (v0002)](https://developer.valvesoftware.com/wiki/Steam_Web_API#GetPlayerSummaries_.28v0002.29)
> Returns basic profile information for a list of 64-bit Steam IDs.
- Arguments
  - **steamids**: Comma-delimited list of 64 bit Steam IDs to return profile information for. Up to 100 Steam IDs can be requested.
  - **key**: Steam Api Key.

```ruby
client = SteamApi::Client.new(your_api_token)
# You can a list with multiple IDs here
client.player_summaries.retrieve([76561198160009756])
```

### [GetFriendList (v0001)](https://developer.valvesoftware.com/wiki/Steam_Web_API#GetFriendList_.28v0001.29)
> Returns the friend list of any Steam user, provided their Steam Community profile visibility is set to "Public".
- Arguments
  - **steamid**: 64 bit Steam ID to return friend list for.
  - **relationship**: Relationship filter. Possibles values: 'all', 'friend'. Defaults to 'all'
  - **key**: Your Steam API Key.

```ruby
client = SteamApi::Client.new(your_api_token)
client.player_friends.retrieve(76561198160009756, 'friend') # 76561197972495328
```

### [GetPlayerAchievements (v0001)](https://developer.valvesoftware.com/wiki/Steam_Web_API#GetPlayerAchievements_.28v0001.29)
> Returns a list of achievements for this user by app id
- Arguments
  - **appid**: The ID for the game you're requesting
  - **steamid**: The SteamID of the account.
  - **key**: Your Steam API Key.

```ruby
client = SteamApi::Client.new(your_api_token)
client.player_achievements.retrieve(1245620, 76561198160009756) # 1245620: Elden Ring
```

### [GetUserStatsForGame (v0002)](https://developer.valvesoftware.com/wiki/Steam_Web_API#GetUserStatsForGame_.28v0002.29)
> Returns a list of achievements for this user by app id
- Arguments
  - **appid**: The ID for the game you're requesting
  - **steamid**: The SteamID of the account.
  - **key**: Your Steam API Key.

```ruby
client = SteamApi::Client.new(your_api_token)
client.player_game_stats.retrieve(1245620, 76561198160009756) # 1245620: Elden Ring
```

### [GetOwnedGames (v0001)](https://developer.valvesoftware.com/wiki/Steam_Web_API#GetOwnedGames_.28v0001.29)
> GetOwnedGames returns a list of games a player owns along with some playtime information, if the profile is publicly visible. Private, friends-only, and other privacy settings are not supported unless you are asking for your own personal details (ie the WebAPI key you are using is linked to the steamid you are requesting).
- Arguments
  - **steamid**: The SteamID of the account.
  - **include_appinfo**: Include game name and logo information in the output. The default is to return appids only. Defaults to 'false'.
  - **include_played_free_games**: By default, free games like Team Fortress 2 are excluded (as technically everyone owns them). If include_played_free_games is set, they will be returned if the player has played them at some point. This is the same behavior as the games list on the Steam Community. Defaults to 'false'.
  - **key**: Your Steam API Key.

```ruby
client = SteamApi::Client.new(your_api_token)
client.player_owned_games.retrieve(76561198160009756) # Defaults other args to false
client.player_owned_games.retrieve(76561198160009756, include_appinfo: true, include_played_free_games: true)
```

### [GetRecentlyPlayedGames (v0001)](https://developer.valvesoftware.com/wiki/Steam_Web_API#GetRecentlyPlayedGames_.28v0001.29)
> GetRecentlyPlayedGames returns a list of games a player has played in the last two weeks, if the profile is publicly visible. Private, friends-only, and other privacy settings are not supported unless you are asking for your own personal details (ie the WebAPI key you are using is linked to the steamid you are requesting).
- Arguments
  - **steamid**: The SteamID of the account.
  - **count**: Optionally limit to a certain number of games (the number of games a person has played in the last 2 weeks is typically very small). Defaults to 5.
  - **key**: Your Steam API Key.

```ruby
client = SteamApi::Client.new(your_api_token)
client.player_recent_games.retrieve(76561198160009756) # Public profile
client.player_recent_games.retrieve(76561197972495328, count=10) # Private profile (everything empty)
```

### [ResolveVanityURL (v0001)](https://wiki.teamfortress.com/wiki/WebAPI/ResolveVanityURL)
> Returns the SteamID of the account.
- Arguments
  - **vanityurl**: The user's vanity URL that you would like to retrieve a steam ID for, e.g. http://steamcommunity.com/id/gabelogannewell would use "gabelogannewell"
  - **key**: Your Steam API Key.

```ruby
client = SteamApi::Client.new(your_api_token)
client.player_steamid.retrieve('gabelogannewell')
client.player_steamid.retrieve('sosolidkk1')
```

### [GetNumberOfCurrentPlayers (v0001)](https://wiki.teamfortress.com/wiki/WebAPI/GetNumberOfCurrentPlayers)
> Returns the number of current players on given Game
- Arguments
  - **appid**: The ID for the game you're requesting.

```ruby
client = SteamApi::Client.new
client.game_current_players.retrieve(440) # Team Fortress 2
client.game_current_players.retrieve(1245620) # Elden Ring
```

### [GetSteamLevel (v0001)](https://wiki.teamfortress.com/wiki/WebAPI/GetSteamLevel)
> Returns the steam level of the player.
- Arguments
  - **steamid**: The SteamID of the account.

```ruby
client = SteamApi::Client.new(your_api_token)
client.player_level.retrieve(76561198160009756)
```

### [App Details](https://wiki.teamfortress.com/wiki/User:RJackson/StorefrontAPI#appdetails)
> Returns the store details for the given app id.
- Arguments
  - **appid**: The ID for the game you're requesting.
    - By default, the current implementation of the SteamApi supports multiple AppIDs at the same time. But this gem does not (yet) supports it.
  - **filters (optional)**: The filters for the data you want to be fetched. For the complete filter listing please access the [StoreFrontAPI](https://wiki.teamfortress.com/wiki/User:RJackson/StorefrontAPI#appdetails) for appdetails endpoint.
    - The filter `basic` returns the following keys:
      - `type`
      - `name`
      - `steam_appid`
      - `required_age`
      - `dlc`
      - `detailed_description`
      - `about_the_game`
      - `supported_languages`
      - `detailed_description`
      - `supported_languages`
      - `header_image`
      - `website`
      - `pc_requirements`
      - `mac_requirements`
      - `linux_requirements`
  - **cc (country_code, optional)**: The code for the country currency you want the prices to come.
  - **l (locale, optional)**: The language the descriptions and text, in general, should be returned.

```ruby
client = SteamApi::Client.new
client.app_details.retrieve(appid: 1091500) # without filter, it returns everything
client.app_details.retrieve(appid: 1091500, filters: ['basic']) # with a filter
client.app_details.retrieve(appid: 1091500, filters: ['basic', 'recommendations', 'achievements']) # with multiple filters
client.app_details.retrieve(appid: 1091500, country_code: 'BR', locale: 'pt') # with different country code and locale
```

## Development

This project runs on docker to better system compatibility and better compatibility and uniform access to OS resources.

Optionally you can run it directly on your machine OS, this is specially useful for MacOS and Windows developers due to performance downgrade on docker virtualization layer. But keep in mind that the CI process runs on docker and its results must prevails over any kind of result difference to your machine.

### Requirements

On your local development machine, you must have installed:
 - `ruby`: any version >= 3.0

### Initial setup

Run `bin/setup` to setup the gem using bundler.

### Interactive console

Launch a new interactive session on ruby with `bin/console`.

### Running specs

Execute all automated tests by running `bin/rspec`.

## Code quality

We use [standardrb](https://github.com/standardrb/standard) tool to run all linters and code quality tools, both in development and on CI.

### Analyzing the code

To run these tools use:

```bash
$ bin/lint
```

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/sosolidkk/steam_api. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [code of conduct](https://github.com/sosolidkk/steam-interface/blob/main/CODE_OF_CONDUCT.md).

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the Steam project's codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/[USERNAME]/steam-interface/blob/main/CODE_OF_CONDUCT.md).
