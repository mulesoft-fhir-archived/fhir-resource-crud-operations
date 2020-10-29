# FHIR - Generic Crud Operations

Provides pre-built MongoDB operations for generic resource CRUD operations. If setting up standard resource implementation straight into / out of a MonogoDB, this plugin can be used to perform the work for the following endpoints:

`get:/(Resource)` - Returns a resource bundle, defaulted to 10 items.

`post:/(Resource)` - Create a new resource.

`put:/(Resource)/{id}` - Updates the specified resource if it exists.

`delete:/(Resource)/{id}` - Deletes the specified resource.

`get:/(Resource)/{id}/_history` - Returns a bundle with the specified resource's change history.

`get:/(Resource)/{id}/_history/{vid}` - Returns the specified version of the specified resource.


## Query parameters:

For all generic resource, this plugin will automatically implement the following query parameters:

`_count` - specify maximum number of items to receive in bundle

`_offset` - specify number of items to skip in bundle

`_id` - id of resource to return in bundle (different from `get:/(Resource)/{id}` as it returns a bundle with a single item).
