# Messaging Service Architecture

Template: `projects/messaging/` in the templates repo (work in progress:
currently a Helm chart `charts/mrjb-app-messaging` and `run-it.ps1`).

Until the template is complete, mirror the API template's layering: swap the
`MrJB.API.<Service>` host for a worker/consumer host
(`MrJB.Messaging.<Service>`) and keep Application, Domain, Data,
Infrastructure, and ServiceDefaults the same.

## Flow

```
Broker → Consumer (host) → Application handler → Domain → Data / Infrastructure
```

Consumers stay thin. They deserialize the message, call an Application
handler, and ack/nack. Business logic never lives in the consumer.

## Rules

- Message contracts are versioned and kept separate from domain models.
- Handlers are idempotent. Assume at-least-once delivery.
- Poison messages go to a dead-letter queue after bounded retries.
- Correlation/trace IDs flow through message headers (OpenTelemetry via ServiceDefaults).

## Preferences to fill in

<!-- TODO: fill these in so Claude stops guessing -->
- Broker(s): RabbitMQ / Azure Service Bus / Kafka?
- Library: MassTransit / NServiceBus / Wolverine / raw client?
- Outbox / inbox pattern:
- Retry policy (counts, backoff):
- Contract package location (e.g. `MrJB.Packages.*`):
- Serialization:
