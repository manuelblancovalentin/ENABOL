	�e��S9�?�e��S9�?!�e��S9�?	T!i�,@T!i�,@!T!i�,@"e
=type.googleapis.com/tensorflow.profiler.PerGenericStepDetails$�e��S9�?�"R�.�?A�D��f��?Y���0B�?*	n����c@2f
/Iterator::Model::ParallelMapV2::Zip[0]::FlatMapA�C��?!����
B@)4�%��?1�5H_��>@:Preprocessing2U
Iterator::Model::ParallelMapV2��?�&M�?!l$���7@)��?�&M�?1l$���7@:Preprocessing2F
Iterator::Model C�*�?!�*ܻsNE@)�(��?1�0/�T�2@:Preprocessing2l
5Iterator::Model::ParallelMapV2::Zip[1]::ForeverRepeat��52;�?!���0@)��-Y�?1ޣEi�*@:Preprocessing2v
?Iterator::Model::ParallelMapV2::Zip[0]::FlatMap[0]::TensorSlice4w��o�?!M�D��@)4w��o�?1M�D��@:Preprocessing2Z
#Iterator::Model::ParallelMapV2::Zip�g��?!l�#D��L@)�}q�J[|?1+�R���@:Preprocessing2x
AIterator::Model::ParallelMapV2::Zip[1]::ForeverRepeat::FromTensor�+ٱ�w?!�P�K�5@)�+ٱ�w?1�P�K�5@:Preprocessing:�
]Enqueuing data: you may want to combine small input data chunks into fewer but larger chunks.
�Data preprocessing: you may increase num_parallel_calls in <a href="https://www.tensorflow.org/api_docs/python/tf/data/Dataset#map" target="_blank">Dataset map()</a> or preprocess the data OFFLINE.
�Reading data from files in advance: you may tune parameters in the following tf.data API (<a href="https://www.tensorflow.org/api_docs/python/tf/data/Dataset#prefetch" target="_blank">prefetch size</a>, <a href="https://www.tensorflow.org/api_docs/python/tf/data/Dataset#interleave" target="_blank">interleave cycle_length</a>, <a href="https://www.tensorflow.org/api_docs/python/tf/data/TFRecordDataset#class_tfrecorddataset" target="_blank">reader buffer_size</a>)
�Reading data from files on demand: you should read data IN ADVANCE using the following tf.data API (<a href="https://www.tensorflow.org/api_docs/python/tf/data/Dataset#prefetch" target="_blank">prefetch</a>, <a href="https://www.tensorflow.org/api_docs/python/tf/data/Dataset#interleave" target="_blank">interleave</a>, <a href="https://www.tensorflow.org/api_docs/python/tf/data/TFRecordDataset#class_tfrecorddataset" target="_blank">reader buffer</a>)
�Other data reading or processing: you may consider using the <a href="https://www.tensorflow.org/programmers_guide/datasets" target="_blank">tf.data API</a> (if you are not using it now)�
:type.googleapis.com/tensorflow.profiler.BottleneckAnalysis�
both�Your program is MODERATELY input-bound because 14.3% of the total step time sampled is waiting for input. Therefore, you would need to reduce both the input time and other time.no*high2t15.4 % of the total step time sampled is spent on 'All Others' time. This could be due to Python execution overhead.9S!i�,@I�{�r�mU@Zno>Look at Section 3 for the breakdown of input time on the host.B�
@type.googleapis.com/tensorflow.profiler.GenericStepTimeBreakdown�
	�"R�.�?�"R�.�?!�"R�.�?      ��!       "      ��!       *      ��!       2	�D��f��?�D��f��?!�D��f��?:      ��!       B      ��!       J	���0B�?���0B�?!���0B�?R      ��!       Z	���0B�?���0B�?!���0B�?b      ��!       JCPU_ONLYYS!i�,@b q�{�r�mU@