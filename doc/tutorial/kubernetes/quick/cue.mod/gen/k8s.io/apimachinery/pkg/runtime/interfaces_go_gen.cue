// Code generated by cue get go. DO NOT EDIT.

//cue:generate cue get go k8s.io/apimachinery/pkg/runtime

package runtime

// APIVersionInternal may be used if you are registering a type that should not
// be considered stable or serialized - it is a convention only and has no
// special behavior in this package.
APIVersionInternal :: "__internal"

// GroupVersioner refines a set of possible conversion targets into a single option.
GroupVersioner :: _

// Identifier represents an identifier.
// Identitier of two different objects should be equal if and only if for every
// input the output they produce is exactly the same.
Identifier :: string // enumIdentifier

enumIdentifier ::
	noopEncoderIdentifier

// Encoder writes objects to a serialized form
Encoder :: _

// Decoder attempts to load an object from data.
Decoder :: _

// Serializer is the core interface for transforming objects into a serialized format and back.
// Implementations may choose to perform conversion of the object, but no assumptions should be made.
Serializer :: _

// Codec is a Serializer that deals with the details of versioning objects. It offers the same
// interface as Serializer, so this is a marker to consumers that care about the version of the objects
// they receive.
Codec :: Serializer

// ParameterCodec defines methods for serializing and deserializing API objects to url.Values and
// performing any necessary conversion. Unlike the normal Codec, query parameters are not self describing
// and the desired version must be specified.
ParameterCodec :: _

// Framer is a factory for creating readers and writers that obey a particular framing pattern.
Framer :: _

// SerializerInfo contains information about a specific serialization format
SerializerInfo :: {
	// MediaType is the value that represents this serializer over the wire.
	MediaType: string

	// MediaTypeType is the first part of the MediaType ("application" in "application/json").
	MediaTypeType: string

	// MediaTypeSubType is the second part of the MediaType ("json" in "application/json").
	MediaTypeSubType: string

	// EncodesAsText indicates this serializer can be encoded to UTF-8 safely.
	EncodesAsText: bool

	// Serializer is the individual object serializer for this media type.
	Serializer: Serializer

	// PrettySerializer, if set, can serialize this object in a form biased towards
	// readability.
	PrettySerializer: Serializer

	// StreamSerializer, if set, describes the streaming serialization format
	// for this media type.
	StreamSerializer: null | StreamSerializerInfo @go(,*StreamSerializerInfo)
}

// StreamSerializerInfo contains information about a specific stream serialization format
StreamSerializerInfo :: {
	// EncodesAsText indicates this serializer can be encoded to UTF-8 safely.
	EncodesAsText: bool

	// Serializer is the top level object serializer for this type when streaming
	Serializer: Serializer

	// Framer is the factory for retrieving streams that separate objects on the wire
	Framer: Framer
}

// NegotiatedSerializer is an interface used for obtaining encoders, decoders, and serializers
// for multiple supported media types. This would commonly be accepted by a server component
// that performs HTTP content negotiation to accept multiple formats.
NegotiatedSerializer :: _

// StorageSerializer is an interface used for obtaining encoders, decoders, and serializers
// that can read and write data at rest. This would commonly be used by client tools that must
// read files, or server side storage interfaces that persist restful objects.
StorageSerializer :: _

// NestedObjectEncoder is an optional interface that objects may implement to be given
// an opportunity to encode any nested Objects / RawExtensions during serialization.
NestedObjectEncoder :: _

// NestedObjectDecoder is an optional interface that objects may implement to be given
// an opportunity to decode any nested Objects / RawExtensions during serialization.
NestedObjectDecoder :: _

ObjectDefaulter :: _

ObjectVersioner :: _

// ObjectConvertor converts an object to a different version.
ObjectConvertor :: _

// ObjectTyper contains methods for extracting the APIVersion and Kind
// of objects.
ObjectTyper :: _

// ObjectCreater contains methods for instantiating an object by kind and version.
ObjectCreater :: _

// EquivalentResourceMapper provides information about resources that address the same underlying data as a specified resource
EquivalentResourceMapper :: _

// EquivalentResourceRegistry provides an EquivalentResourceMapper interface,
// and allows registering known resource[/subresource] -> kind
EquivalentResourceRegistry :: _

// ResourceVersioner provides methods for setting and retrieving
// the resource version from an API object.
ResourceVersioner :: _

// SelfLinker provides methods for setting and retrieving the SelfLink field of an API object.
SelfLinker :: _

// Object interface must be supported by all API types registered with Scheme. Since objects in a scheme are
// expected to be serialized to the wire, the interface an Object must provide to the Scheme allows
// serializers to set the kind, version, and group the object is represented as. An Object may choose
// to return a no-op ObjectKindAccessor in cases where it is not expected to be serialized.
Object :: _

// CacheableObject allows an object to cache its different serializations
// to avoid performing the same serialization multiple times.
CacheableObject :: _

// Unstructured objects store values as map[string]interface{}, with only values that can be serialized
// to JSON allowed.
Unstructured :: _