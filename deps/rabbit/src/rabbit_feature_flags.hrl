-define(PT_INVENTORY_KEY, rabbit_ff_registry).
%% The `persistent_term' key used to hold the feature flag inventory.
%%
%% `persistent_term:get(?PT_INVENTORY_KEY)' should return a value with the type
%% `rabbit_feature_flags:inventory()' if the registry is initialized.
%%
%% Rather than fetching this key directly, use the functions in the
%% `rabbit_ff_registry' module.

-define(
   IS_FEATURE_FLAG(FeatureProps),
   (is_map(FeatureProps) andalso not ?IS_DEPRECATION(FeatureProps))).

-define(
   IS_DEPRECATION(FeatureProps),
   (is_map(FeatureProps) andalso is_map_key(deprecation_phase, FeatureProps))).
