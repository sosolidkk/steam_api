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
TODO

### Authorization
TODO

### GetNewsForApp (v0002)
- [Doc link](https://developer.valvesoftware.com/wiki/Steam_Web_API#GetNewsForApp_.28v0002.29)

### GetGlobalAchievementPercentagesForApp (v0002)
- [Doc link](https://developer.valvesoftware.com/wiki/Steam_Web_API#GetGlobalAchievementPercentagesForApp_.28v0002.29)

### GetPlayerSummaries (v0002)
- [Doc link](https://developer.valvesoftware.com/wiki/Steam_Web_API#GetPlayerSummaries_.28v0002.29)

### GetFriendList (v0001)
- [Doc link](https://developer.valvesoftware.com/wiki/Steam_Web_API#GetFriendList_.28v0001.29)

### GetPlayerAchievements (v0001)
- [Doc link](https://developer.valvesoftware.com/wiki/Steam_Web_API#GetPlayerAchievements_.28v0001.29)

### GetUserStatsForGame (v0002)
- [Doc link](https://developer.valvesoftware.com/wiki/Steam_Web_API#GetUserStatsForGame_.28v0002.29)

### GetOwnedGames (v0001)
- [Doc link](https://developer.valvesoftware.com/wiki/Steam_Web_API#GetOwnedGames_.28v0001.29)

### GetRecentlyPlayedGames (v0001)
- [Doc link](https://developer.valvesoftware.com/wiki/Steam_Web_API#GetRecentlyPlayedGames_.28v0001.29)

### ResolveVanityURL (v0001)
- [Doc link](https://wiki.teamfortress.com/wiki/WebAPI/ResolveVanityURL)

### GetNumberOfCurrentPlayers (v0001)
- [Doc link](https://wiki.teamfortress.com/wiki/WebAPI/GetNumberOfCurrentPlayers)

### GetSteamLevel (v0001)
- [Doc link](https://wiki.teamfortress.com/wiki/WebAPI/GetSteamLevel)

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and the created tag, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/[USERNAME]/steam-interface. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [code of conduct](https://github.com/sosolidkk/steam-interface/blob/main/CODE_OF_CONDUCT.md).

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the Steam::Interface project's codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/[USERNAME]/steam-interface/blob/main/CODE_OF_CONDUCT.md).
