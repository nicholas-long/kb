# API enumeration

## bug hunting workflow
tips from InsiderPhD
- target endpoints that have the most complex business logic
- tools
  - arjun for discovering parameters
  - burp suite for fuzzing and requests
  - wfuzz/ffuf for fuzzing
  - kiterunner
- workflow
  - mess around on the site with burp suite recording requests
    - "press all the buttons"
  - look for
    - endpoints returning info
    - IDs
    - signs of internal APIs
    - reflected input
    - self documenting APIs
      - look for swagger, usually in `/__swagger__/`
  - assess API structure
    - find all endpoints for resources and what they do
    - assess impact of changing things
    - look for self documenting API endpoints to quickly find all the other endpoints
  - enumerate resources
  - enumerate parameters for endpoints
  - run wfuzz/ffuf through burp to get all the endpoints in burp automatically
- wordlists
  - seclists
    - raft words
  - fuzzdb
  - nahamsec video on wordlist creation
  - API wordlist creation
    - similar services' documented APIs
    - cewl wordlist from site
      - waybackmachine
    - append any domain specific knowledge to wordlists

## good wordlists

### seclists for endpoints
/usr/share/seclists/Discovery/Web-Content/common-api-endpoints-mazen160.txt
/usr/share/seclists/Discovery/Web-Content/api/
/usr/share/seclists/Discovery/Web-Content/api/api-endpoints.txt
/usr/share/seclists/Discovery/Web-Content/swagger.txt
/usr/share/seclists/Fuzzing/fuzz-Bo0oM.txt

### parameters
/usr/share/seclists/Discovery/Web-Content/api/objects.txt
/usr/share/seclists/Discovery/Web-Content/burp-parameter-names.txt

### commonly used list of words
/usr/share/seclists/Discovery/Web-Content/raft-small-words.txt

### last resort?
/usr/share/seclists/Discovery/Web-Content/directory-list-2.3-big.txt
/usr/share/seclists/Discovery/DNS/dns-Jhaddix.txt

### API enumeration wordlists by size
```
      49 /usr/share/seclists/Discovery/Web-Content/swagger.txt
     268 /usr/share/seclists/Discovery/Web-Content/api/api-endpoints.txt
    2588 /usr/share/seclists/Discovery/Web-Content/burp-parameter-names.txt
    3132 /usr/share/seclists/Discovery/Web-Content/api/objects.txt
    4842 /usr/share/seclists/Fuzzing/fuzz-Bo0oM.txt
 1273833 /usr/share/seclists/Discovery/Web-Content/directory-list-2.3-big.txt
 2171687 /usr/share/seclists/Discovery/DNS/dns-Jhaddix.txt
```

# GraphQL APIs
alternative to RESTful APIs, but works very differently.
only one endpoint for every resource. queries for common operations; look very different from SQL.
much less recon than RESTful APIs.
newer technology -> developers adopting early without considering security.
## GraphQL introspection and recon
introspection can disclose fields. not considered a bug, it is like API documentation.
even if introspection is off, can still do normal API recon.
occasionally verbose error messages will leak info by suggesting mistakes in queries.
## common GraphQL bugs
- same exact types of bugs as normal APIs
- IDORs
- busness logic errors
- possibility to enumerate internal API endpoints leads to plenty of information disclosure
- GraphQL specific bugs
  - usually require access to source code and review
  - insufficient type checks on values
  - switching object's types
  - NoSQL injection through JSON types "custom scalar types"
## GraphQL tools
- `GraphQL voyager` is a tool to visualize GraphQL using introspection
  - can see the queries and mutations that are defined for this database, provides query/mutation payloads
- GraphQL IDE
- Altair
- `InQL` burp add-on
- `GraphQLmap`
  - test for injections in data
- `graphql-path-enum` for finding paths A -> B (think like bloodhound)
## common specific GraphQL endpoints
- ql
- gql
- graphql
- graphiql
- graphql/console
look out for queries mentioning queries (q) and mutation
queries are usually URL encoded
## how GraphQL works
- implements graph structure in database
- reading and modifying, code written ahead of time
  - queries fetch data
  - mutations edit
  - fragments are lists of fields
  - metafields for inspection of query or mutation
- fragments are like classes of data with defined fields
  - a list of things to select that can be reused for different objects
## writing GraphQL queries
look like functions - they return one or more items
queries can contain things like strings, but it's not JSON. JSON is returned by the API as the result of queries.
## writing GraphQL mutations
mutation is defined to reference fields in json passed in
```graphql
mutaiton CreateBlah($param: Thing) {
  paramField
}
```
```json
{ "param": "value" }
```
## example GraphQL queries from InsiderPHD video
```graphql
{
  # return hero's name and name of every friend
  hero {
    name
    friends {
      name
    }
  }
}
{
  human(id: 1000) {
    name
    height(Unit: FOOT)
  }
}
```

# GraphQL API pentesting to try list
- recon
  - /graphiql is endpoint with in-browser GraphQL IDE
    - IDE is also available within InQL burp extension
  - `/graphql?query=` with url encoded queries or mutations
  - enumerate with introspection
    - payloadsallthethings has GraphQL enumeration payloads
    - take output of introspection payload and paste into GraphQL voyager
- identify business logic of each endpoint
- craft queries to check for IDORs or information disclosure
- pay attention to the syntax - the most difficult part
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
 5720 total
