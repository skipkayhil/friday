# Friday

Friday is a repository task runner. It currently uses Dependabot to parse
repositories' dependencies and provides insight into their usage.

## Development

```bash
docker-compose up rails-dev
```

Which will start the following containers


| Service       | Port |
| ------------- | ---- |
| rails (api)   | 3000 |
| vite (web)    | 4000 |
| postgres (db) | 5432 |
| redis (db)    | 6379 |

There is also an optional `resque` container that can be run to process background jobs.

## License

Copyright (C) 2021 Hartley McGuire

This program is free software: you can redistribute it and/or modify
it under the terms of the GNU General Public License as published by
the Free Software Foundation, either version 3 of the License, or
(at your option) any later version.

This program is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
GNU General Public License for more details.

You should have received a copy of the GNU General Public License
along with this program.  If not, see <https://www.gnu.org/licenses/>.
