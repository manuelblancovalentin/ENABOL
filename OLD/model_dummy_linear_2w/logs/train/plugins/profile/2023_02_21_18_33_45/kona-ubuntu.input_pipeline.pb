	�Ov3�?�Ov3�?!�Ov3�?	=��V1@=��V1@!=��V1@"e
=type.googleapis.com/tensorflow.profiler.PerGenericStepDetails$�Ov3�?�A�f��?A&R���0�?Y��uR_��?*	ObX9�Y@2f
/Iterator::Model::ParallelMapV2::Zip[0]::FlatMap�~1[�*�?!��� NAA@)���-�?1!��ˊ�>@:Preprocessing2F
Iterator::ModelZ�>�-W�?!��Q+F@)���Dh�?1��S�O�9@:Preprocessing2U
Iterator::Model::ParallelMapV2����?!lS�kS�2@)����?1lS�kS�2@:Preprocessing2l
5Iterator::Model::ParallelMapV2::Zip[1]::ForeverRepeat%Ί��>�?!��W�"�-@))=�K�e�?1�}�l)@:Preprocessing2Z
#Iterator::Model::ParallelMapV2::ZipD�ÖM�?!�X�T��K@)�M~�N�z?1Vgk��@@:Preprocessing2v
?Iterator::Model::ParallelMapV2::Zip[0]::FlatMap[0]::TensorSlice�`��o?!��@��@@)�`��o?1��@��@@:Preprocessing2x
AIterator::Model::ParallelMapV2::Zip[1]::ForeverRepeat::FromTensor�C�r�cc?!��j��j@)�C�r�cc?1��j��j@:Preprocessing:�
]Enqueuing data: you may want to combine small input data chunks into fewer but larger chunks.
�Data preprocessing: you may increase num_parallel_calls in <a href="https://www.tensorflow.org/api_docs/python/tf/data/Dataset#map" target="_blank">Dataset map()</a> or preprocess the data OFFLINE.
�Reading data from files in advance: you may tune parameters in the following tf.data API (<a href="https://www.tensorflow.org/api_docs/python/tf/data/Dataset#prefetch" target="_blank">prefetch size</a>, <a href="https://www.tensorflow.org/api_docs/python/tf/data/Dataset#interleave" target="_blank">interleave cycle_length</a>, <a href="https://www.tensorflow.org/api_docs/python/tf/data/TFRecordDataset#class_tfrecorddataset" target="_blank">reader buffer_size</a>)
�Reading data from files on demand: you should read data IN ADVANCE using the following tf.data API (<a href="https://www.tensorflow.org/api_docs/python/tf/data/Dataset#prefetch" target="_blank">prefetch</a>, <a href="https://www.tensorflow.org/api_docs/python/tf/data/Dataset#interleave" target="_blank">interleave</a>, <a href="https://www.tensorflow.org/api_docs/python/tf/data/TFRecordDataset#class_tfrecorddataset" target="_blank">reader buffer</a>)
�Other data reading or processing: you may consider using the <a href="https://www.tensorflow.org/programmers_guide/datasets" target="_blank">tf.data API</a> (if you are not using it now)�
:type.googleapis.com/tensorflow.profiler.BottleneckAnalysis�
both�Your program is MODERATELY input-bound because 17.1% of the total step time sampled is waiting for input. Therefore, you would need to reduce both the input time and other time.no*moderate2t12.4 % of the total step time sampled is spent on 'All Others' time. This could be due to Python execution overhead.9=��V1@I��G��T@Zno>Look at Section 3 for the breakdown of input time on the host.B�
@type.googleapis.com/tensorflow.profiler.GenericStepTimeBreakdown�
	�A�f��?�A�f��?!�A�f��?      ��!       "      ��!       *      ��!       2	&R���0�?&R���0�?!&R���0�?:      ��!       B      ��!       J	��uR_��?��uR_��?!��uR_��?R      ��!       Z	��uR_��?��uR_��?!��uR_��?b      ��!       JCPU_ONLYY=��V1@b q��G��T@