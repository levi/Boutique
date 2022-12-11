import Foundation

public extension Store where Item: Identifiable, Item.ID == String {

    /// Initializes a new ``Store`` for persisting items to a memory cache and a storage engine, acting as a source of truth.
    ///
    /// The items will be loaded asynchronously in a background task. If you need to show the
    /// content of the Store right away, you have two options:
    ///
    /// - Move the initialization to an `async` context, so you can use the `async` version of the init:
    /// ```
    /// func loadStore() async {
    ///     let store = try await Store(...)
    ///     let items = await store.items
    /// }
    /// ```
    /// This will return the store only when items have been loaded.
    ///
    /// - Wait for items to be loaded before accessing them:
    /// ```
    /// let store: Store<YourItem> = Store(...)
    /// func getItems() async -> [YourItem] {
    ///     try await store.itemsHaveLoaded()
    ///     return await store.items
    /// }
    /// ```
    ///
    /// This initializer eschews providing a `cacheIdentifier` when our `Item` conforms to `Identifiable`
    /// with an `id` that is a `String`. While it's not required for your `Item` to conform to `Identifiable`,
    /// many SwiftUI-related objects do so this initializer provides a nice convenience.
    /// - Parameter storage: A `StorageEngine` to initialize a ``Store`` instance with.
    convenience init(storage: StorageEngine) {
        self.init(storage: storage, cacheIdentifier: \.id)
    }
    
    /// Initializes a new ``Store`` for persisting items to a memory cache and a storage engine, acting as a source of truth, and await for the ``items`` to load.
    ///
    /// This initializer eschews providing a `cacheIdentifier` when our `Item` conforms to `Identifiable`
    /// with an `id` that is a `String`. While it's not required for your `Item` to conform to `Identifiable`,
    /// many SwiftUI-related objects do so this initializer provides a nice convenience.
    /// - Parameter storage: A `StorageEngine` to initialize a ``Store`` instance with.
    convenience init(storage: StorageEngine) async throws {
        try await self.init(storage: storage, cacheIdentifier: \.id)
    }
}

public extension Store where Item: Identifiable, Item.ID == UUID {

    /// Initializes a new ``Store`` for persisting items to a memory cache and a storage engine, acting as a source of truth.
    ///
    /// The items will be loaded asynchronously in a background task. If you need to show the
    /// content of the Store right away, you have two options:
    ///
    /// - Move the initialization to an `async` context, so you can use the `async` version of the init:
    /// ```
    /// func loadStore() async {
    ///     let store = try await Store(...)
    ///     let items = await store.items
    /// }
    /// ```
    /// This will return the store only when items have been loaded.
    ///
    /// - Wait for items to be loaded before accessing them:
    /// ```
    /// let store: Store<YourItem> = Store(...)
    /// func getItems() async -> [YourItem] {
    ///     try await store.itemsHaveLoaded()
    ///     return await store.items
    /// }
    /// ```
    ///
    /// This initializer eschews providing a `cacheIdentifier` when our `Item` conforms to `Identifiable`
    /// with an `id` that is a `UUID`. While it's not required for your `Item` to conform to `Identifiable`,
    /// many SwiftUI-related objects do so this initializer provides a nice convenience.
    /// - Parameter storage: A `StorageEngine` to initialize a ``Store`` instance with.
    convenience init(storage: StorageEngine) {
        self.init(storage: storage, cacheIdentifier: \.id.uuidString)
    }
    /// Initializes a new ``Store`` for persisting items to a memory cache and a storage engine, acting as a source of truth, and await for the ``items`` to load.
    ///
    /// This initializer eschews providing a `cacheIdentifier` when our `Item` conforms to `Identifiable`
    /// with an `id` that is a `UUID`. While it's not required for your `Item` to conform to `Identifiable`,
    /// many SwiftUI-related objects do so this initializer provides a nice convenience.
    /// - Parameter storage: A `StorageEngine` to initialize a ``Store`` instance with.
    convenience init(storage: StorageEngine) async throws {
        try await self.init(storage: storage, cacheIdentifier: \.id.uuidString)
    }
}
