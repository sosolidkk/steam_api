# Steam::Interface

A project for fetching some information from [Steam Web Api](https://developer.valvesoftware.com/wiki/Steam_Web_API).

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

All use of the Steam Web API requires the use of an API Key. You can acquire one [by filling out this form](https://steamcommunity.com/dev/apikey).

### Configuring the client

Just use the following snippet to configure the client:

```ruby
Steam::Client.configure do |config|
  config.api_token = 'your-API-token-value'
end
```

### Authorization

To perform some of the requests, not all of them, you need to create an API Token in your steam account. You follow [this guide](https://steamcommunity.com/dev/apikey) to know how to do it.

After having the token, you can initialize the client like the configuring section, or if you want a standalone usage, you can do it this way:

```ruby
client = Steam::Client.new('API-token-value')
```

Some endpoints don't need an API Key, so you can use the client without providing any. You can find which in the next section.

### [GetNewsForApp (v0002)](https://developer.valvesoftware.com/wiki/Steam_Web_API#GetNewsForApp_.28v0002.29)
> GetNewsForApp returns the latest of a game specified by its appID.
- Arguments
  - **appid**: AppID of the game you want the news of.
  - **count**: How many news enties you want to get returned.
  - **maxlength**: Maximum length of each news entry. Defaults to 300

```ruby
client = Steam::Client.new
client.app_news.retrieve(400, 3, 300)
```

### [GetGlobalAchievementPercentagesForApp (v0002)](https://developer.valvesoftware.com/wiki/Steam_Web_API#GetGlobalAchievementPercentagesForApp_.28v0002.29)
> Returns a global achievements overview of a specific game in percentages.
- Arguments
  - **gameid**: AppID of the game you want the news of.

```ruby
client = Steam::Client.new
client.app_global_achievements.retrieve(440)
```

### [GetPlayerSummaries (v0002)](https://developer.valvesoftware.com/wiki/Steam_Web_API#GetPlayerSummaries_.28v0002.29)
> Returns basic profile information for a list of 64-bit Steam IDs.
- Arguments
  - **steamids**: Comma-delimited list of 64 bit Steam IDs to return profile information for. Up to 100 Steam IDs can be requested.
  - **key**: Steam Api Key.

```ruby
client = Steam::Client.new(your_api_token)
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
client = Steam::Client.new(your_api_token)
client.player_friends.retrieve(76561198160009756, 'friend') # 76561197972495328
```

### [GetPlayerAchievements (v0001)](https://developer.valvesoftware.com/wiki/Steam_Web_API#GetPlayerAchievements_.28v0001.29)
> Returns a list of achievements for this user by app id
- Arguments
  - **appid**: The ID for the game you're requesting
  - **steamid**: The SteamID of the account.
  - **key**: Your Steam API Key.

```ruby
client = Steam::Client.new(your_api_token)
client.player_achievements.retrieve(1245620, 76561198160009756) # 1245620: Elden Ring
```

### [GetUserStatsForGame (v0002)](https://developer.valvesoftware.com/wiki/Steam_Web_API#GetUserStatsForGame_.28v0002.29)
> Returns a list of achievements for this user by app id
- Arguments
  - **appid**: The ID for the game you're requesting
  - **steamid**: The SteamID of the account.
  - **key**: Your Steam API Key.

```ruby
client = Steam::Client.new(your_api_token)
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
client = Steam::Client.new(your_api_token)
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
client = Steam::Client.new(your_api_token)
client.player_recent_games.retrieve(76561198160009756) # Public profile
client.player_recent_games.retrieve(76561197972495328, count=10) # Private profile (everything empty)
```

### [ResolveVanityURL (v0001)](https://wiki.teamfortress.com/wiki/WebAPI/ResolveVanityURL)
> Returns the SteamID of the account.
- Arguments
  - **vanityurl**: The user's vanity URL that you would like to retrieve a steam ID for, e.g. http://steamcommunity.com/id/gabelogannewell would use "gabelogannewell"
  - **key**: Your Steam API Key.

```ruby
client = Steam::Client.new(your_api_token)
client.player_steamid.retrieve('gabelogannewell')
client.player_steamid.retrieve('sosolidkk1')
```

### [GetNumberOfCurrentPlayers (v0001)](https://wiki.teamfortress.com/wiki/WebAPI/GetNumberOfCurrentPlayers)
> Returns the number of current players on given Game
- Arguments
  - **appid**: The ID for the game you're requesting.

```ruby
client = Steam::Client.new
client.game_current_players.retrieve(440) # Team Fortress 2
client.game_current_players.retrieve(1245620) # Elden Ring
```

### [GetSteamLevel (v0001)](https://wiki.teamfortress.com/wiki/WebAPI/GetSteamLevel)
> Returns the steam level of the player.
- Arguments
  - **steamid**: The SteamID of the account.

```ruby
client = Steam::Client.new(your_api_token)
client.player_level.retrieve(76561198160009756)
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and the created tag, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/[USERNAME]/steam-interface. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [code of conduct](https://github.com/sosolidkk/steam-interface/blob/main/CODE_OF_CONDUCT.md).

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the Steam::Interface project's codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/[USERNAME]/steam-interface/blob/main/CODE_OF_CONDUCT.md).
