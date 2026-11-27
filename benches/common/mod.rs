pub mod tree;
pub mod usage;

use criterion::Throughput;

/// Criterion throughput for a benchmark over `count` elements
pub fn elements(count: usize) -> Throughput {
    Throughput::Elements(u64::try_from(count).expect("a benchmark size fits in u64"))
}
